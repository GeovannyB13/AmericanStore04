import 'package:flutter/material.dart';

class CalzadoScreen extends StatelessWidget {
  const CalzadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calzado"),
      ),
      body: const Center(
        child: Text(
          "Pantalla de Calzado",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}