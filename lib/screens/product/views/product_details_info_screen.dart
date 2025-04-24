import 'package:flutter/material.dart';

class ProductDetailsInfoScreen extends StatelessWidget {
  const ProductDetailsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Producto"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalles del Producto",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Este producto está hecho con materiales de alta calidad y diseñado para ofrecer comodidad y estilo. Es perfecto para cualquier ocasión y combina bien con una variedad de accesorios.",
            ),
            SizedBox(height: 20),
            Text(
              "Características:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("- Material: Algodón 100%"),
            Text("- Color: Gris"),
            Text("- Tallas disponibles: S, M, L, XL"),
          ],
        ),
      ),
    );
  }
}
