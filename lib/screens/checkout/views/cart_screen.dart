import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para copiar al portapapeles
import 'package:shop/models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito de Compras"),
      ),
      body: ListView.builder(
        itemCount: 2, // Limitar a dos productos
        itemBuilder: (context, index) {
          final product = demoPopularProducts[index];
          return ListTile(
            leading: Image.network(
              product.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.title),
            subtitle: Text("Precio: \$${product.price.toStringAsFixed(2)}"),
            trailing: product.priceAfetDiscount != null
                ? Text(
                    "Descuento: \$${product.priceAfetDiscount!.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.green),
                  )
                : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Pago con PayPal"),
              content: const Text(
                  "Usa el siguiente enlace para realizar el pago con PayPal:"),
              actions: [
                TextButton(
                  onPressed: () {
                    const paypalLink =
                        "https://www.paypal.com/paypalme/yourbusiness";
                    Clipboard.setData(const ClipboardData(text: paypalLink));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Enlace copiado al portapapeles")),
                    );
                  },
                  child: const Text("Copiar enlace"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cerrar"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.payment),
      ),
    );
  }
}
