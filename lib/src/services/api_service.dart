import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // URL flutter web
  static const String baseUrl = 'http://localhost:8080';

  // Appel POST pour une connexion
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors de la connexion');
    }
  }

    // Appel POST pour l'inscription
  static Future<Map<String, dynamic>> register(
      String email, String password,  String username) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password,'username' : username,}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors de l’inscription');
    }
  }
}
