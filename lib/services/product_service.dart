import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/models/product_model.dart';

class ProductService {
  static Future<List<ProductModel>> fetchProducts() async {
    const url = 'https://americanstore04.shop/wp-json/wc/v3/products?consumer_key=ck_0f236b8f457fa9aaa3fc2a941f6c947346d66699&consumer_secret=cs_f84a1d3b5ba65c40b9a301c426bcd6bc443fa81e';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}

