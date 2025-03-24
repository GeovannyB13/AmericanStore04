import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de notificaciones de ejemplo
    final List<Map<String, String>> notifications = [
      {
        "title": "Nueva oferta disponible",
        "subtitle": "Aprovecha un 20% de descuento en tu próxima compra.",
      },
      {
        "title": "Actualización de pedido",
        "subtitle": "Tu pedido #12345 ha sido enviado.",
      },
      {
        "title": "Promoción especial",
        "subtitle": "Compra 2 y lleva 1 gratis en productos seleccionados.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificaciones"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(notifications[index]["title"]!),
              subtitle: Text(notifications[index]["subtitle"]!),
              leading: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
            ),
          );
        },
      ),
    );
  }
}