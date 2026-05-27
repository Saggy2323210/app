import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/router.dart';
import 'app/theme.dart';
import 'core/db/isar_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarDb.init();
  runApp(const ProviderScope(child: TradeMindsApp()));
}

class TradeMindsApp extends StatelessWidget {
  const TradeMindsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TradeMinds AI',
      theme: TradeMindsTheme.darkTheme,
      routerConfig: router,
    );
  }
}
