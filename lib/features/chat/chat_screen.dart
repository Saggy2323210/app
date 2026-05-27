import 'package:flutter/material.dart';
import '../../core/widgets/ai_provider_switcher.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: AIProviderSwitcher(),
          )
        ],
      ),
      body: const Center(
        child: Text('Chat Placeholder'),
      ),
    );
  }
}
