import 'package:flutter/material.dart';

class ProductReturnsInfoScreen extends StatelessWidget {
  const ProductReturnsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información de Devoluciones"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Política de Devoluciones",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "1. Puedes devolver cualquier producto dentro de los 30 días posteriores a la compra.",
            ),
            SizedBox(height: 10),
            Text(
              "2. El producto debe estar en su estado original, sin usar y con todas las etiquetas.",
            ),
            SizedBox(height: 10),
            Text(
              "3. Los costos de envío de la devolución correrán por cuenta del cliente, salvo que el producto esté defectuoso.",
            ),
            SizedBox(height: 20),
            Text(
              "Para iniciar una devolución, por favor contacta a nuestro equipo de soporte.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
