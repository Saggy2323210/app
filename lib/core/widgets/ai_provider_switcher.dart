import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ai_provider_notifier.dart';
import '../../app/theme.dart';

class AIProviderSwitcher extends ConsumerWidget {
  const AIProviderSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiState = ref.watch(aiProviderNotifierProvider);

    // Determine color based on health
    Color chipColor = Colors.grey;
    final health = aiState.providerHealth[aiState.activeProvider];
    if (aiState.globalMode == AIMode.ollama || aiState.activeProvider == 'ollama') {
      chipColor = Colors.blue;
    } else if (health != null) {
      if (health.status == 'online') {
        chipColor = health.latencyMs < 1000 ? TradeMindsTheme.electricGreen : TradeMindsTheme.warningYellow;
      } else {
        chipColor = TradeMindsTheme.alertRed;
      }
    }

    String label = "${_capitalize(aiState.activeProvider)} ${aiState.activeModel}";
    if (aiState.globalMode == AIMode.auto) {
      label = "Auto ($label)";
    }

    return ActionChip(
      avatar: CircleAvatar(
        backgroundColor: chipColor,
        radius: 8,
      ),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      backgroundColor: TradeMindsTheme.surfaceColor,
      side: BorderSide(color: chipColor.withOpacity(0.5)),
      onPressed: () {
        ref.read(aiProviderNotifierProvider.notifier).refreshHealth();
        _showProviderBottomSheet(context, ref);
      },
    );
  }

  String _capitalize(String s) => s.isEmpty ? s : "${s[0].toUpperCase()}${s.substring(1)}";

  void _showProviderBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const _ProviderBottomSheetContent();
      },
    );
  }
}

class _ProviderBottomSheetContent extends ConsumerWidget {
  const _ProviderBottomSheetContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiState = ref.watch(aiProviderNotifierProvider);
    final notifier = ref.read(aiProviderNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'AI Provider Settings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: aiState.globalMode == AIMode.auto,
                onChanged: (val) {
                  if(val) {
                     notifier.switchProvider('gemini', 'gemini-1.5-pro', isAuto: true);
                  }
                },
                activeColor: TradeMindsTheme.electricGreen,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildProviderSection(context, ref, 'gemini', 'Gemini (Google AI Studio)', aiState),
          _buildProviderSection(context, ref, 'nvidia', 'NVIDIA NIM (Cloud GPU)', aiState),
          _buildProviderSection(context, ref, 'ollama', 'Ollama (Privacy Mode)', aiState),
        ],
      ),
    );
  }

  Widget _buildProviderSection(BuildContext context, WidgetRef ref, String providerKey, String title, AIProviderState aiState) {
    final health = aiState.providerHealth[providerKey];
    final isOnline = health?.status == 'online';

    return ExpansionTile(
      title: Row(
        children: [
          Text(title),
          const SizedBox(width: 8),
          if (isOnline)
            const Icon(Icons.check_circle, color: TradeMindsTheme.electricGreen, size: 16)
          else
            const Icon(Icons.error, color: TradeMindsTheme.alertRed, size: 16)
        ],
      ),
      children: health?.models.map((model) {
        final isActive = aiState.activeProvider == providerKey && aiState.activeModel == model && aiState.globalMode != AIMode.auto;
        return ListTile(
          title: Text(model),
          trailing: isActive ? const Icon(Icons.check, color: TradeMindsTheme.electricGreen) : null,
          onTap: () {
            ref.read(aiProviderNotifierProvider.notifier).switchProvider(providerKey, model, isAuto: false);
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Switched to $title - $model')),
            );
          },
        );
      }).toList() ?? [const ListTile(title: Text('No models available or provider offline'))],
    );
  }
}
