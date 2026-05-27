import 'package:flutter/material.dart';
import '../../core/widgets/ai_provider_switcher.dart';

class AnalyzerScreen extends StatelessWidget {
  const AnalyzerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analyzer'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: AIProviderSwitcher(),
          )
        ],
      ),
      body: const Center(
        child: Text('Analyzer Placeholder'),
      ),
    );
  }
}
