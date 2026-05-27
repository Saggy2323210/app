import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/holding.dart';
import '../models/trade.dart';
import '../models/watchlist_item.dart';
import '../models/agent_suggestion.dart';
import '../models/user_risk_profile.dart';

part 'isar_db.g.dart';

@collection
class AIProviderConfig {
  Id id = Isar.autoIncrement;

  @enumerated
  AIMode globalMode = AIMode.auto;

  String activeProvider = 'gemini';
  String activeModel = 'gemini-1.5-pro';

  // Storing per-agent config as JSON string for simplicity
  String perAgentConfigJson = '{}';
}

enum AIMode { auto, gemini, nvidia, ollama }

class IsarDb {
  static late Isar instance;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [
        AIProviderConfigSchema,
        HoldingSchema,
        TradeSchema,
        WatchlistItemSchema,
        AgentSuggestionSchema,
        UserRiskProfileSchema,
      ],
      directory: dir.path,
    );

    // Initialize default config if not exists
    if (await instance.aIProviderConfigs.count() == 0) {
      await instance.writeTxn(() async {
        await instance.aIProviderConfigs.put(AIProviderConfig());
      });
    }
  }
}
