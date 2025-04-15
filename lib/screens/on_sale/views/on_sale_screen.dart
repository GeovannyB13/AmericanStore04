import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/components/product/product_card.dart';
import '../../../../constants.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos en oferta de ejemplo
    final List<ProductModel> onSaleProducts = [
      ProductModel(
        title: "Producto 1",
        image: "assets/images/product1.png",
        price: 100.0,
        priceAfetDiscount: 80.0,
        dicountpercent: 20,
        brandName: "Marca 1",
        category: "Electrónica", // Añadido
      ),
      ProductModel(
        title: "Producto 2",
        image: "assets/images/product2.png",
        price: 150.0,
        priceAfetDiscount: 120.0,
        dicountpercent: 20,
        brandName: "Marca 2",
        category: "Hogar", // Añadido
      ),
      // Agrega más productos según sea necesario
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('En Oferta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView.builder(
          itemCount: onSaleProducts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: ProductCard(
                image: onSaleProducts[index].image,
                brandName: onSaleProducts[index].brandName,
                title: onSaleProducts[index].title,
                price: onSaleProducts[index].price,
                priceAfetDiscount: onSaleProducts[index].priceAfetDiscount,
                dicountpercent: onSaleProducts[index].dicountpercent,
                press: () {
                  // Lógica para manejar el evento de presionar el producto
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
