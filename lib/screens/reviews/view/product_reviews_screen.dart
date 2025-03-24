import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/components/review_card.dart';
import 'package:shop/constants.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de reseñas de ejemplo
    final List<Map<String, dynamic>> reviews = [
      {
        "user": "Juan Pérez",
        "rating": 4.5,
        "review": "Excelente producto, muy recomendable.",
        "date": "2025-03-20",
      },
      {
        "user": "María García",
        "rating": 4.0,
        "review": "Buena calidad, pero el envío fue un poco lento.",
        "date": "2025-03-18",
      },
      {
        "user": "Carlos López",
        "rating": 5.0,
        "review": "Me encantó, volveré a comprar.",
        "date": "2025-03-15",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reseñas del Producto"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Bookmark.svg",
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(defaultPadding),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(reviews[index]["user"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Icon(
                        starIndex < reviews[index]["rating"]
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(reviews[index]["review"]),
                  const SizedBox(height: 4),
                  Text(
                    reviews[index]["date"],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
