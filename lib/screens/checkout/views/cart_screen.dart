import 'package:flutter/material.dart';
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
        itemCount: demoPopularProducts.length,
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
    );
  }
}
