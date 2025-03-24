import 'package:flutter/material.dart';
import 'package:shop/constants.dart';

import 'components/prederence_list_tile.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferencias de Cookies"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Restablecer"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            PreferencesListTile(
              titleText: "Analíticas",
              subtitleTxt:
                  "Las cookies analíticas nos ayudan a mejorar nuestra aplicación recopilando y reportando información sobre cómo la usas. Recopilan información de una manera que no identifica directamente a nadie.",
              isActive: true,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Personalización",
              subtitleTxt:
                  "Las cookies de personalización recopilan información sobre tu uso de esta aplicación para mostrar contenido y experiencias que sean relevantes para ti.",
              isActive: false,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Marketing",
              subtitleTxt:
                  "Las cookies de marketing recopilan información sobre tu uso de esta y otras aplicaciones para mostrar anuncios y otros contenidos de marketing que sean más relevantes para ti.",
              isActive: false,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Cookies de redes sociales",
              subtitleTxt:
                  "Estas cookies son establecidas por una variedad de servicios de redes sociales que hemos añadido al sitio para permitirte compartir nuestro contenido con tus amigos y redes.",
              isActive: false,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
