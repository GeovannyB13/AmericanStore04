import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/category_model.dart';
import 'package:shop/screens/search/views/components/search_form.dart';
import '../../../api/paypal_api.dart' show PayPalAPI; // Importa la API de PayPal

import 'components/expansion_category.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SearchForm(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Categorías",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: demoCategories.length,
                itemBuilder: (context, index) => ExpansionCategory(
                  svgSrc: demoCategories[index].svgSrc!,
                  title: demoCategories[index].title,
                  subCategory: demoCategories[index].subCategories!,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Llama a la API de PayPal para generar un enlace de pago
            final paymentLink = await PayPalAPI.createPayment(50.0); // Monto de ejemplo
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Pago con PayPal"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Usa el siguiente enlace para realizar el pago:"),
                    const SizedBox(height: 10),
                    SelectableText(paymentLink, style: const TextStyle(color: Colors.blue)),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: paymentLink));
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
          } catch (e) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text("No se pudo generar el enlace de pago: $e"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cerrar"),
                  ),
                ],
              ),
            );
          }
        },
        child: const Icon(Icons.payment),
      ),
    );
  }
}
