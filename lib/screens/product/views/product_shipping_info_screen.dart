import 'package:flutter/material.dart';

class ProductShippingInfoScreen extends StatelessWidget {
  const ProductShippingInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información de Envío"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Información de Envío",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Ofrecemos envío rápido y seguro a nivel nacional e internacional. Los tiempos de entrega pueden variar según la ubicación.",
            ),
            SizedBox(height: 20),
            Text(
              "Opciones de Envío:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("- Envío estándar: 5-7 días hábiles"),
            Text("- Envío exprés: 2-3 días hábiles"),
            Text("- Envío internacional: 7-14 días hábiles"),
          ],
        ),
      ),
    );
  }
}
