import 'package:isar/isar.dart';

part 'holding.g.dart';

@collection
class Holding {
  Id id = Isar.autoIncrement;

  late String symbol;
  late double buyPrice;
  late double quantity;
  late DateTime date;
  late String instrumentType;
  late String exchange;
}
