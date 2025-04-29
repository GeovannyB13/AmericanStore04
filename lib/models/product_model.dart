// Solo para demostración
import 'package:shop/constants.dart';

class ProductModel {
  final String image, brandName, title, category;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    required this.category,
    this.priceAfetDiscount,
    this.dicountpercent,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // Obtener imagen principal
    String imageUrl = "";
    if (json["images"] != null && json["images"].isNotEmpty) {
      imageUrl = json["images"][0]["src"];
    }

    // Obtener marca (brand)
    String brand = "";
    if (json["brands"] != null && json["brands"].isNotEmpty) {
      brand = json["brands"][0]["name"];
    }

    // Obtener categoría
    String category = "";
    if (json["categories"] != null && json["categories"].isNotEmpty) {
      category = json["categories"][0]["name"];
    }

    // Precios
    double price = double.tryParse(json["price"] ?? "0") ?? 0;
    double? salePrice = (json["sale_price"] != null && json["sale_price"] != "")
        ? double.tryParse(json["sale_price"])
        : null;

    // Descuento
    int? discountPercent;
    if (salePrice != null && salePrice < price && price > 0) {
      discountPercent = (((price - salePrice) / price) * 100).round();
    }

    return ProductModel(
      image: imageUrl,
      brandName: brand,
      title: json["name"] ?? "",
      price: price,
      priceAfetDiscount: salePrice,
      dicountpercent: discountPercent,
      category: category,
    );
  }
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image: productDemoImg1,
    title: "Camiseta Puma beishe",
    brandName: "Puma",
    price: 25,
    category: "Ropa",
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Capsulas Ibuprofeno 2x1",
    brandName: "Kirkland",
    price: 26.5,
    category: "Vitaminas",
  ),
  ProductModel(
    image: productDemoImg5,
    title: "Zapatos Puma Basquet",
    brandName: "PUMA",
    price: 70,
    category: "Zapatos",
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Zapatos PUMA campus",
    brandName: "PUMA",
    price: 40,
    category: "Zapatos",
  )
];

List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Marca C",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
    category: "Zapatos",
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca D",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
    category: "Ropa",
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
    category: "Ropa",
  ),
];

List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: "assets/images/Profile_example.png",
    title: "Jean Oversize Azul",
    brandName: "Marca E",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
    category: "Ropa",
  ),
  ProductModel(
    image: "assets/images/Profile_example.png",
    title: "Top de Corsé de Satén Blanco",
    brandName: "Marca F",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
    category: "Ropa",
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
    category: "Ropa",
  ),
];

List<ProductModel> kidsProducts = [
  ProductModel(
    image: "assets/images/Profile_example.png",
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca G",
    price: 650.62,
    priceAfetDiscount: 590.36,
    dicountpercent: 24,
    category: "Ropa",
  ),
  ProductModel(
    image: "assets/images/Profile_example.png",
    title: "Vestido Sin Mangas con Volantes",
    brandName: "Marca H",
    price: 650.62,
    category: "Ropa",
  ),
  ProductModel(
    image: "https://i.imgur.com/pXnYE9Q.png",
    title: "Vestido de Punto con Mangas Volantes",
    brandName: "Marca I",
    price: 400,
    category: "Ropa",
  ),
  ProductModel(
    image: "https://i.imgur.com/V1MXgfa.png",
    title: "Suéter Beta de Montaña Verde",
    brandName: "Marca J",
    price: 400,
    priceAfetDiscount: 360,
    dicountpercent: 20,
    category: "Ropa",
  ),
  ProductModel(
    image: "https://i.imgur.com/8gvE5Ss.png",
    title: "Vestido Sin Mangas con Volantes",
    brandName: "Marca H",
    price: 654,
    category: "Ropa",
  ),
  ProductModel(
    image: "https://i.imgur.com/cBvB5YB.png",
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 250,
    category: "Ropa",
  ),
];
