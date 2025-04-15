import 'package:flutter/material.dart';
import 'package:shop/screens/product/views/product_details_info_screen.dart';
import 'package:shop/screens/product/views/product_shipping_info_screen.dart';
import 'package:shop/screens/product/views/product_returns_info_screen.dart'; // Nueva pantalla

// ...existing code...

final Map<String, WidgetBuilder> appRoutes = {
  // ...existing routes...
  '/product-details-info': (context) => const ProductDetailsInfoScreen(),
  '/product-shipping-info': (context) => const ProductShippingInfoScreen(),
  '/product-returns-info': (context) => const ProductReturnsInfoScreen(), // Nueva ruta
};