import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

class ProductDetailsInfoScreen extends StatelessWidget {
  const ProductDetailsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Producto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.brandName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              product.category,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              "Descripción:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Este producto no tiene descripción disponible. Para más información, contáctanos o revisa las características en la tienda.",
            ),
            // Puedes agregar más campos dinámicos aquí si tu modelo los tiene
          ],
        ),
      ),
    );
  }
}
