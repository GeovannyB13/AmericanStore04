import 'package:flutter/material.dart';

class VitaminasScreen extends StatelessWidget {
  const VitaminasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vitaminas"),
      ),
      body: const Center(
        child: Text(
          "Pantalla de Vitaminas",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}