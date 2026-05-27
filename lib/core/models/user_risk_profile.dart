import 'package:isar/isar.dart';

part 'user_risk_profile.g.dart';

@collection
class UserRiskProfile {
  Id id = Isar.autoIncrement;
  late String profile; // Conservative, Moderate, Aggressive
  late double availableCapital;
}
