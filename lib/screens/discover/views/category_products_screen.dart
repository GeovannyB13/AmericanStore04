import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/product_service.dart';
import 'package:shop/components/product/product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  const CategoryProductsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: FutureBuilder<List<ProductModel>>(
        future: ProductService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay productos'));
          }
          final products = snapshot.data!
              .where((p) => p.category.toLowerCase() == categoryName.toLowerCase())
              .toList();
          return products.isEmpty
              ? const Center(child: Text('No hay productos en esta categoría'))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    image: products[index].image,
                    brandName: products[index].brandName,
                    title: products[index].title,
                    price: products[index].price,
                    priceAfetDiscount: products[index].priceAfetDiscount,
                    dicountpercent: products[index].dicountpercent,
                    press: () {
                      Navigator.pushNamed(
                        context,
                        '/product-details',
                        arguments: products[index],
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}