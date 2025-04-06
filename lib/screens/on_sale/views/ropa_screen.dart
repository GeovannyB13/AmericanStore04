import 'package:flutter/material.dart';

class RopaScreen extends StatelessWidget {
  const RopaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ropa"),
      ),
      body: const Center(
        child: Text(
          "Pantalla de Ropa",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}