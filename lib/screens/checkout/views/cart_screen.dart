import 'package:flutter/material.dart';
import 'package:shop/screens/bookmark/views/bookmark_screen.dart'; // Importa la nueva vista

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirigir a la nueva vista
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BookmarkScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Muestra un indicador de carga mientras se redirige
      ),
    );
  }
}
