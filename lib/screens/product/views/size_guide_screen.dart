import 'package:flutter/material.dart';

class SizeGuideScreen extends StatefulWidget {
  const SizeGuideScreen({super.key});

  @override
  State<SizeGuideScreen> createState() => _SizeGuideScreenState();
}

class _SizeGuideScreenState extends State<SizeGuideScreen> {
  bool _isShowCentimetersSize = false;

  void updateSizes() {
    setState(() {
      _isShowCentimetersSize = !_isShowCentimetersSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guía de Tallas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cómo elegir tu talla",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. Mide tu cuerpo con una cinta métrica para obtener las medidas exactas de tu pecho, cintura y caderas.",
            ),
            const SizedBox(height: 10),
            const Text(
              "2. Consulta la tabla de tallas para encontrar la talla que mejor se ajuste a tus medidas.",
            ),
            const SizedBox(height: 10),
            const Text(
              "3. Si estás entre dos tallas, elige la más grande para mayor comodidad.",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Mostrar en centímetros",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: _isShowCentimetersSize,
                  onChanged: (value) => updateSizes(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _isShowCentimetersSize
                  ? "Tabla de Tallas (cm):\n- S: Pecho 86-91, Cintura 71-76, Caderas 91-96\n- M: Pecho 92-97, Cintura 77-82, Caderas 97-102\n- L: Pecho 98-103, Cintura 83-88, Caderas 103-108"
                  : "Tabla de Tallas (pulgadas):\n- S: Pecho 34-36, Cintura 28-30, Caderas 36-38\n- M: Pecho 36-38, Cintura 30-32, Caderas 38-40\n- L: Pecho 38-40, Cintura 32-34, Caderas 40-42",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
