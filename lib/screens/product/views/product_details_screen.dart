import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/components/cart_button.dart';
import 'package:shop/components/custom_modal_bottom_sheet.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/constants.dart';

import 'package:shop/route/screen_export.dart';

import 'components/product_images.dart';
import 'components/product_info.dart';
import 'components/product_list_tile.dart';
import '../../../components/review_card.dart';
import 'product_buy_now_screen.dart';
import 'package:shop/models/product_model.dart'; // Asegúrate de importar el modelo
import 'package:shop/services/product_service.dart'; // Importa el servicio de productos

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Usa widget.product en vez de ModalRoute.of(context)!.settings.arguments

    return Scaffold(
      bottomNavigationBar: CartButton(
        price: product.price,
        press: () {
          customModalBottomSheet(
            context,
            height: MediaQuery.of(context).size.height * 0.92,
            child: ProductBuyNowScreen(product: product), // <-- pasa el producto
          );
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ],
            ),
            ProductImages(
              images: [product.image],
            ),
            ProductInfo(
              brand: product.brandName,
              title: product.title,
              isAvailable: true,
              description: "", // Si tienes descripción en tu modelo, úsala aquí
              price: product.price.toInt(),
              rating: 0, // Si tienes rating, úsalo aquí
              numOfReviews: 0, // Si tienes reviews, úsalo aquí
            ),
            ProductListTile(
              svgSrc: "assets/icons/Product.svg",
              title: "Detalles del Producto",
              press: () {
                Navigator.pushNamed(
                  context,
                  '/product-details-info',
                  arguments: product, // <-- pasa el producto
                );
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Delivery.svg",
              title: "Información de Envío",
              press: () {
                Navigator.pushNamed(context, '/product-shipping-info'); // Enlace ajustado
              },
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Devoluciones",
              isShowBottomBorder: true,
              press: () {
                Navigator.pushNamed(context, '/product-returns-info'); // Enlace ajustado
              },
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: 4.3,
                  numOfReviews: 128,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reseñas",
              isShowBottomBorder: true,
              press: () {
                Navigator.pushNamed(context, productReviewsScreenRoute);
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "También te puede interesar",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: FutureBuilder<List<ProductModel>>(
                  future: ProductService.fetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No hay productos'));
                    }
                    // Filtra productos para no mostrar el mismo producto actual
                    final relatedProducts = snapshot.data!
                        .where((p) => p.title != product.title)
                        .take(10)
                        .toList();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: relatedProducts.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                          left: defaultPadding,
                          right: index == relatedProducts.length - 1 ? defaultPadding : 0,
                        ),
                        child: ProductCard(
                          image: relatedProducts[index].image,
                          title: relatedProducts[index].title,
                          brandName: relatedProducts[index].brandName,
                          price: relatedProducts[index].price,
                          priceAfetDiscount: relatedProducts[index].priceAfetDiscount,
                          dicountpercent: relatedProducts[index].dicountpercent,
                          press: () {
                            Navigator.pushNamed(
                              context,
                              productDetailsScreenRoute,
                              arguments: relatedProducts[index],
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
