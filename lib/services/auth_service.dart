import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://americanstore04.shop/wp-json/wp/v2";

  // Método para iniciar sesión
  Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/jwt-auth/v1/token");

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

  // Método para registrar un usuario
  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final url = Uri.parse("$baseUrl/users");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer YOUR_ADMIN_TOKEN", // Reemplaza con un token de administrador
        },
        body: jsonEncode({
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 201) {
        return {
          "success": true,
          "message": "Usuario registrado exitosamente",
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