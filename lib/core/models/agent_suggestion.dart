import 'package:isar/isar.dart';

part 'agent_suggestion.g.dart';

@collection
class AgentSuggestion {
  Id id = Isar.autoIncrement;
  late String data;
}
