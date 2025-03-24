import 'package:flutter/material.dart';

class NotificationOptionsScreen extends StatefulWidget {
  const NotificationOptionsScreen({super.key});

  @override
  _NotificationOptionsScreenState createState() => _NotificationOptionsScreenState();
}

class _NotificationOptionsScreenState extends State<NotificationOptionsScreen> {
  bool _promotionsEnabled = true;
  bool _updatesEnabled = true;
  bool _orderStatusEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de Notificación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configura tus opciones de notificación:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Promociones'),
              value: _promotionsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _promotionsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Actualizaciones'),
              value: _updatesEnabled,
              onChanged: (bool value) {
                setState(() {
                  _updatesEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Estado del Pedido'),
              value: _orderStatusEnabled,
              onChanged: (bool value) {
                setState(() {
                  _orderStatusEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para guardar las configuraciones de notificación
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Opciones de notificación guardadas')),
                  );
                },
                child: const Text('Guardar Configuraciones'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}