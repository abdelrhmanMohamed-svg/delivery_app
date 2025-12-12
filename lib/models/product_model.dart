class ProductModel {
  final String productId;
  final String name;
  final String subtitle;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final String type;
  final String description;
  final int quantity;
  final bool isRecommended;

  ProductModel({
    required this.productId,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.type = "Naturales",
    this.quantity = 1,
    this.isRecommended = false,
    this.description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonummy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
  });

  ProductModel copyWith({
    String? productId,
    String? name,
    String? subtitle,
    double? price,
    String? imageUrl,
    bool? isFavorite,
    String? type,
    String? description,
    int? quantity,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      type: type ?? this.type,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }
}

final List<ProductModel> dummyProducts = [
  ProductModel(
    productId: "p1",
    name: "Pizza Clásica",
    subtitle: "Salsa clásica de la casa",
    price: 12.58,
    imageUrl: "assets/images/product/pizza_p.png",
  ),
  ProductModel(
    productId: "p2",
    name: "Hamburguesa mix",
    subtitle: "Doble carne con queso",
    price: 12.58,
    imageUrl: "assets/images/product/burger_p.png",
  ),
  ProductModel(
    productId: "p3",
    name: "Pizza Clásica",
    subtitle: "Salsa clásica de la casa",
    price: 12.58,
    imageUrl: "assets/images/product/pizza_p.png",
  ),
  ProductModel(
    productId: "p4",
    name: "Hamburguesa mix",
    subtitle: "Doble carne con queso",
    price: 12.58,
    imageUrl: "assets/images/product/burger_p.png",
  ),
  ProductModel(
    productId: "p5",
    name: "Malteadas tropicales",
    subtitle: "Elaborado con jugos naturales",
    imageUrl: "assets/images/product/drink.png",
    price: 12.58,
    isRecommended: true,
  ),
  ProductModel(
    productId: "p6",
    name: "Malteadas tropicales",
    subtitle: "Elaborado con jugos naturales",
    imageUrl: "assets/images/product/drink.png",
    price: 12.58,
    isRecommended: true,
  ),
  ProductModel(
    productId: "p7",
    name: "Malteadas tropicales",
    subtitle: "Elaborado con jugos naturales",
    imageUrl: "assets/images/product/drink.png",
    price: 12.58,
    isRecommended: true,
  ),
];

List<ProductModel> cartList = [
  ProductModel(
    productId: "p4",
    name: "Hamburguesa mix",
    subtitle: "Doble carne con queso",
    price: 12.58,
    imageUrl: "assets/images/product/burger_p.png",
  ),
  ProductModel(
    productId: "p3",
    name: "Pizza Clásica",
    subtitle: "Salsa clásica de la casa",
    price: 12.58,
    imageUrl: "assets/images/product/pizza_p.png",
  ),
];
