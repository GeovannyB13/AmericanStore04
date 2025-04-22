import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://americanstore04.shop/wp-json/jwt-auth/v1";

  // Método para iniciar sesión
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/token");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          "success": true,
          "token": data["token"],
          "user": data["user_display_name"],
        };
      } else {
        final error = jsonDecode(response.body);
        return {
          "success": false,
          "message": error["message"] ?? "Error desconocido",
        };
      }
    } catch (e) {
      return {
        "success": false,
        "message": "Error de conexión: $e",
      };
    }
  }
}