import 'package:flutter/material.dart';
import '../../core/widgets/ai_provider_switcher.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: AIProviderSwitcher(),
          )
        ],
      ),
      body: const Center(
        child: Text('Dashboard Placeholder'),
      ),
    );
  }
}
