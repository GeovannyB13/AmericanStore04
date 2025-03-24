import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductReturnsScreen extends StatelessWidget {
  const ProductReturnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: defaultPadding),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 40,
                    child: BackButton(),
                  ),
                  Text(
                    "Devoluciones",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Text(
                "Devoluciones y cambios prepagados gratuitos para pedidos enviados a los EE. UU. Obtén un reembolso más rápido con devoluciones en línea fáciles e imprime una etiqueta de devolución prepagada GRATIS en línea. Devuelve o cambia cualquier mercancía no utilizada o defectuosa por correo o en una de nuestras tiendas en EE. UU. o Canadá. Los artículos hechos a pedido no se pueden cancelar, cambiar o devolver.",
              ),
            )
          ],
        ),
      ),
    );
  }
}
