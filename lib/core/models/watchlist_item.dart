import 'package:isar/isar.dart';

part 'watchlist_item.g.dart';

@collection
class WatchlistItem {
  Id id = Isar.autoIncrement;
  late String symbol;
}
