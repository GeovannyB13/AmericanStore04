import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class AuthService {
  final String baseUrl = "https://americanstore04.shop/wp-json/wc/v3";
  final String consumerKey = "ck_0f236b8f457fa9aaa3fc2a941f6c947346d66699"; // Reemplaza con tu Consumer Key
  final String consumerSecret = "cs_f84a1d3b5ba65c40b9a301c426bcd6bc443fa81e"; // Reemplaza con tu Consumer Secret

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

  // Método para obtener productos
  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.parse(
      "$baseUrl/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret",
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((product) {
          return ProductModel(
            image: product["images"].isNotEmpty ? product["images"][0]["src"] : "",
            title: product["name"],
            brandName: product["brands"] ?? "Sin marca", // Si tienes un plugin de marcas
            price: double.tryParse(product["price"]) ?? 0.0,
            category: product["categories"].isNotEmpty
                ? product["categories"][0]["name"]
                : "Sin categoría",
            priceAfetDiscount: product["sale_price"] != null
                ? double.tryParse(product["sale_price"])
                : null,
            dicountpercent: product["regular_price"] != null && product["sale_price"] != null
                ? ((double.tryParse(product["regular_price"])! -
                        double.tryParse(product["sale_price"])!) /
                    double.tryParse(product["regular_price"])! *
                    100)
                    .round()
                : null,
          );
        }).toList();
      } else {
        throw Exception("Error al obtener productos: ${response.body}");
      }
    } catch (e) {
      throw Exception("Error de conexión: $e");
    }
  }
}