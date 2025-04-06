import 'package:flutter/material.dart';

class AccesoriosScreen extends StatelessWidget {
  const AccesoriosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accesorios"),
      ),
      body: const Center(
        child: Text(
          "Pantalla de Accesorios",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}