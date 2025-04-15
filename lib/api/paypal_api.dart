import 'dart:convert';
import 'package:http/http.dart' as http;

class PayPalAPI {
  static const String clientId =
      "AQELFEkeAw4Ija2q5crciv6lJwN-KW3BMXklBFyUnRAeWhYiyx-ZpKaXAWp4x-XJfexvrwWs0DCC45LS1";
  static const String secret =
      "EG30ffvH6KUzl6E1uS8EzVvstlVj4Fv6hKifaCMrvas2prx2l8u5APC19V1X7bHpeH9LwSvhMeqL_i64";
  static const String baseUrl = "https://api.sandbox.paypal.com";

  static Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse("$baseUrl/v1/oauth2/token"),
      headers: {
        "Authorization": "Basic ${base64Encode(utf8.encode('$clientId:$secret'))}",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: "grant_type=client_credentials",
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      throw Exception("Error al obtener el token de acceso");
    }
  }

  static Future<String> createPayment(double amount) async {
    final accessToken = await getAccessToken();
    final response = await http.post(
      Uri.parse("$baseUrl/v1/payments/payment"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
      },
      body: jsonEncode({
        "intent": "sale",
        "redirect_urls": {
          "return_url": "https://example.com/return",
          "cancel_url": "https://example.com/cancel"
        },
        "payer": {"payment_method": "paypal"},
        "transactions": [
          {
            "amount": {
              "total": amount.toStringAsFixed(2),
              "currency": "USD",
            },
            "description": "Compra en AmericanStore",
          }
        ]
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data['links']
          .firstWhere((link) => link['rel'] == 'approval_url')['href'];
    } else {
      throw Exception("Error al crear el pago");
    }
  }
}
