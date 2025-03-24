class CategoryModel {
  final String title;
  final String? image, svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.svgSrc,
    this.subCategories,
  });
}

final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(title: "Woman’s", image: "https://i.imgur.com/5M89G2P.png"),
  CategoryModel(title: "Man’s", image: "https://i.imgur.com/UM3GdWg.png"),
  CategoryModel(title: "Kid’s", image: "https://i.imgur.com/Lp0D6k5.png"),
  CategoryModel(title: "Accessories", image: "https://i.imgur.com/3mSE5sN.png"),
];

final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "Ropa",
    svgSrc: "assets/icons/Clothing.svg",
    subCategories: [
      CategoryModel(title: "Todo la Ropa"),
      CategoryModel(title: "Novedades"),
      CategoryModel(title: "Abrigos y Chaquetas"),
      CategoryModel(title: "Vestidos"),
      CategoryModel(title: "Jeans"),
    ],
  ),
  CategoryModel(
    title: "Zapatos",
    svgSrc: "assets/icons/Shoes.svg",
    subCategories: [
      CategoryModel(title: "Todo los Zapatos"),
      CategoryModel(title: "Novedades"),
      CategoryModel(title: "Deportivos"),
      CategoryModel(title: "Formales"),
    ],
  ),
  CategoryModel(
    title: "Vitaminas",
    svgSrc: "assets/icons/Vitamins.svg",
    subCategories: [
      CategoryModel(title: "Todas las Vitaminas"),
      CategoryModel(title: "Novedades"),
      CategoryModel(title: "Vitaminas A-Z"),
      CategoryModel(title: "Suplementos"),
    ],
  ),
];
