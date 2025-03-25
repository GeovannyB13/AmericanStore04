// Solo para demostración
import 'package:shop/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image: productDemoImg1,
    title: "Buzo de Montaña para Mujeres",
    brandName: "Marca A",
    price: 540,
    priceAfetDiscount: 420,
    dicountpercent: 20,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 800,
  ),
  ProductModel(
    image: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Marca C",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca D",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: "https://i.imgur.com/tXyOMMG.png",
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca E",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: "https://i.imgur.com/h2LqppX.png",
    title: "Top de Corsé de Satén Blanco",
    brandName: "Marca F",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
];

List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Marca C",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca D",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];

List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: "https://drive.google.com/file/d/1SmVW4mkGRiXyTRhEiOFp75cCGKQG9olG/view?usp=drive_link",
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca E",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: "https://drive.google.com/file/d/1s1id1gdoAeolS4pxCtK4sxGySxJY38lW/view?usp=drive_link",
    title: "Top de Corsé de Satén Blanco",
    brandName: "Marca F",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];

List<ProductModel> kidsProducts = [
  ProductModel(
    image: "https://i.imgur.com/dbbT6PA.png",
    title: "Frente Ruched Poplin Verde",
    brandName: "Marca G",
    price: 650.62,
    priceAfetDiscount: 590.36,
    dicountpercent: 24,
  ),
  ProductModel(
    image: "https://i.imgur.com/7fSxC7k.png",
    title: "Vestido Sin Mangas con Volantes",
    brandName: "Marca H",
    price: 650.62,
  ),
  ProductModel(
    image: "https://i.imgur.com/pXnYE9Q.png",
    title: "Vestido de Punto con Mangas Volantes",
    brandName: "Marca I",
    price: 400,
  ),
  ProductModel(
    image: "https://i.imgur.com/V1MXgfa.png",
    title: "Suéter Beta de Montaña Verde",
    brandName: "Marca J",
    price: 400,
    priceAfetDiscount: 360,
    dicountpercent: 20,
  ),
  ProductModel(
    image: "https://i.imgur.com/8gvE5Ss.png",
    title: "Vestido Sin Mangas con Volantes",
    brandName: "Marca H",
    price: 654,
  ),
  ProductModel(
    image: "https://i.imgur.com/cBvB5YB.png",
    title: "Suéter Beta de Montaña",
    brandName: "Marca B",
    price: 250,
  ),
];
