import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/ai_provider_service.dart';
import '../db/isar_db.dart';
import 'package:isar/isar.dart';

class AgentModelConfig {
  final String provider;
  final String model;

  AgentModelConfig({required this.provider, required this.model});
}

class ProviderHealth {
  final String status;
  final int latencyMs;
  final List<String> models;

  ProviderHealth({required this.status, required this.latencyMs, required this.models});
}

class AIProviderState {
  final AIMode globalMode;
  final String activeProvider;
  final String activeModel;
  final Map<String, AgentModelConfig> perAgentConfig;
  final Map<String, ProviderHealth> providerHealth;

  AIProviderState({
    this.globalMode = AIMode.auto,
    this.activeProvider = 'gemini',
    this.activeModel = 'gemini-1.5-pro',
    this.perAgentConfig = const {},
    this.providerHealth = const {},
  });

  AIProviderState copyWith({
    AIMode? globalMode,
    String? activeProvider,
    String? activeModel,
    Map<String, AgentModelConfig>? perAgentConfig,
    Map<String, ProviderHealth>? providerHealth,
  }) {
    return AIProviderState(
      globalMode: globalMode ?? this.globalMode,
      activeProvider: activeProvider ?? this.activeProvider,
      activeModel: activeModel ?? this.activeModel,
      perAgentConfig: perAgentConfig ?? this.perAgentConfig,
      providerHealth: providerHealth ?? this.providerHealth,
    );
  }
}

class AIProviderNotifier extends StateNotifier<AIProviderState> {
  final AIProviderService _service = AIProviderService();
  Timer? _healthTimer;

  AIProviderNotifier() : super(AIProviderState()) {
    _initDefaults();
    _loadFromDb();
    _startHealthPolling();
  }

  void _initDefaults() {
    state = state.copyWith(
      perAgentConfig: {
        'market_analyst': AgentModelConfig(provider: 'gemini', model: 'gemini-1.5-flash'),
        'strategy': AgentModelConfig(provider: 'nvidia', model: 'meta/llama-3.1-70b-instruct'),
        'risk': AgentModelConfig(provider: 'gemini', model: 'gemini-1.5-pro'),
        'execution_guide': AgentModelConfig(provider: 'ollama', model: 'phi3:medium'),
        'portfolio_monitor': AgentModelConfig(provider: 'gemini', model: 'gemini-1.5-flash'),
      }
    );
  }

  Future<void> _loadFromDb() async {
    final config = await IsarDb.instance.aIProviderConfigs.where().findFirst();
    if (config != null) {
      state = state.copyWith(
        globalMode: config.globalMode,
        activeProvider: config.activeProvider,
        activeModel: config.activeModel,
      );
      // Push loaded config to backend
      if (config.globalMode == AIMode.auto) {
         await _service.setProvider('auto', 'auto');
      } else {
         await _service.setProvider(config.activeProvider, config.activeModel);
      }
    }
  }

  Future<void> _saveToDb() async {
    final config = await IsarDb.instance.aIProviderConfigs.where().findFirst() ?? AIProviderConfig();
    config.globalMode = state.globalMode;
    config.activeProvider = state.activeProvider;
    config.activeModel = state.activeModel;
    await IsarDb.instance.writeTxn(() async {
      await IsarDb.instance.aIProviderConfigs.put(config);
    });
  }

  void _startHealthPolling() {
    refreshHealth();
    _healthTimer = Timer.periodic(const Duration(seconds: 60), (_) => refreshHealth());
  }

  @override
  void dispose() {
    _healthTimer?.cancel();
    super.dispose();
  }

  Future<void> switchProvider(String provider, String model, {bool isAuto = false}) async {
    AIMode mode = isAuto ? AIMode.auto : AIMode.auto;
    if (!isAuto) {
      switch(provider) {
        case 'gemini': mode = AIMode.gemini; break;
        case 'nvidia': mode = AIMode.nvidia; break;
        case 'ollama': mode = AIMode.ollama; break;
      }
    }

    await _service.setProvider(isAuto ? 'auto' : provider, isAuto ? 'auto' : model);
    state = state.copyWith(
      globalMode: mode,
      activeProvider: provider,
      activeModel: model,
    );
    await _saveToDb();
  }

  Future<void> setAgentModel(String agent, String provider, String model) async {
    await _service.setAgentModel(agent, provider, model);
    final updatedConfig = Map<String, AgentModelConfig>.from(state.perAgentConfig);
    updatedConfig[agent] = AgentModelConfig(provider: provider, model: model);
    state = state.copyWith(perAgentConfig: updatedConfig);
  }

  Future<void> refreshHealth() async {
    final healthData = await _service.getHealth();
    if (healthData.isNotEmpty) {
      final newHealth = <String, ProviderHealth>{};
      healthData.forEach((key, value) {
        newHealth[key] = ProviderHealth(
          status: value['status'],
          latencyMs: value['latency_ms'],
          models: List<String>.from(value['models']),
        );
      });
      state = state.copyWith(providerHealth: newHealth);
    }
  }

  void resetToDefaults() {
    _initDefaults();
  }
}

final aiProviderNotifierProvider = StateNotifierProvider<AIProviderNotifier, AIProviderState>((ref) {
  return AIProviderNotifier();
});
