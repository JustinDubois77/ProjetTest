import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Change cette URL selon l'environnement :
  //static const String baseUrl = 'http://10.0.2.2:3000'; // Emulateur Android
   static const String baseUrl = 'http://localhost:8080'; // Flutter web
  // static const String baseUrl = 'http://192.168.x.x:3000'; // Appareil physique

  // Exemple : appel GET pour récupérer la liste des utilisateurs
  static Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur de chargement des utilisateurs');
    }
  }

  // Exemple : appel POST pour une connexion
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/authentification/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur lors de la connexion');
    }
  }
}