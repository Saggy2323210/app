import 'package:flutter/material.dart';
import '../../core/widgets/ai_provider_switcher.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: AIProviderSwitcher(),
          )
        ],
      ),
      body: const Center(
        child: Text('Portfolio Placeholder'),
      ),
    );
  }
}
