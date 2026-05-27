import 'dart:convert';
import 'package:http/http.dart' as http;

class AIProviderService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/ai';

  Future<Map<String, dynamic>> getHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health')).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      print('Health check error: $e');
    }
    return {};
  }

  Future<void> setProvider(String provider, String model) async {
    try {
      await http.post(
        Uri.parse('$baseUrl/set-provider'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'provider': provider, 'model': model}),
      );
    } catch (e) {
      print('Set provider error: $e');
    }
  }

  Future<void> setAgentModel(String agent, String provider, String model) async {
    try {
      await http.post(
        Uri.parse('$baseUrl/set-agent-model'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'agent': agent, 'provider': provider, 'model': model}),
      );
    } catch (e) {
      print('Set agent model error: $e');
    }
  }
}
