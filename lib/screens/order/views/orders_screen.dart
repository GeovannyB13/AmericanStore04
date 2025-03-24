import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de pedidos de ejemplo
    final List<Map<String, String>> orders = [
      {
        "orderNumber": "#12345",
        "status": "Enviado",
        "date": "2025-03-20",
      },
      {
        "orderNumber": "#12346",
        "status": "Procesando",
        "date": "2025-03-21",
      },
      {
        "orderNumber": "#12347",
        "status": "Entregado",
        "date": "2025-03-22",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Pedidos"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text("Pedido ${orders[index]["orderNumber"]}"),
              subtitle: Text("Estado: ${orders[index]["status"]}\nFecha: ${orders[index]["date"]}"),
              leading: Icon(Icons.shopping_bag, color: Theme.of(context).primaryColor),
            ),
          );
        },
      ),
    );
  }
}
