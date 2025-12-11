class ProductModel {
  final String productId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  ProductModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

final List<ProductModel> dummyProducts = [
  ProductModel(
    productId: "p1",
    name: "Pizza Clásica",
    description: "Salsa clásica de la casa",
    price: 12.58,
    imageUrl: "assets/images/product/pizza_p.png",
  ),
  ProductModel(
    productId: "p2",
    name: "Hamburguesa mix",
    description: "Doble carne con queso",
    price: 12.58,
    imageUrl: "assets/images/product/burger_p.png",
  ),
  ProductModel(
    productId: "p1",
    name: "Pizza Clásica",
    description: "Salsa clásica de la casa",
    price: 12.58,
    imageUrl: "assets/images/product/pizza_p.png",
  ),
  ProductModel(
    productId: "p2",
    name: "Hamburguesa mix",
    description: "Doble carne con queso",
    price: 12.58,
    imageUrl: "assets/images/product/burger_p.png",
  ),
];
