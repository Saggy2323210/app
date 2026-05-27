import 'package:go_router/go_router.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/analyzer/analyzer_screen.dart';
import '../features/portfolio/portfolio_screen.dart';
import '../features/chat/chat_screen.dart';
import '../features/groww_sync/groww_sync_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/onboarding/onboarding_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: '/analyzer',
      builder: (context, state) => const AnalyzerScreen(),
    ),
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const PortfolioScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/sync',
      builder: (context, state) => const GrowwSyncScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
  ],
);
