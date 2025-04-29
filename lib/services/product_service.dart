import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/models/product_model.dart';

class ProductService {
  static Future<List<ProductModel>> fetchProducts() async {
    final url = 'https://americanstore04.shop/wp-json/wc/v3/products?consumer_key=ck_be82e9bcc7022449635ec1f7e4842666085d5814&consumer_secret=cs_d2ce3b1894726af85625a9ac9d1f4d62e06f0a1c';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}