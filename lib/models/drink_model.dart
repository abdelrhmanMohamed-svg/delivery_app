class DrinkModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String type;

  DrinkModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.type = "Naturales",
  });
}

List<DrinkModel> dummyDrinks = [
  DrinkModel(
    id: "1",
    name: "Malteadas tropicales",
    description: "Elaborado con jugos naturales",
    imageUrl: "assets/images/product/drink.png",
    price: 12.58,
  ),
  DrinkModel(
    id: "2",
    name: "Malteadas tropicales",
    description: "Elaborado con jugos naturales",
    imageUrl: "assets/images/product/drink.png",
    price: 12.58,
  ),
  DrinkModel(
    id: "3",
    name: "Malteadas tropicales",
    description: "Elaborado con jugos naturales",
    imageUrl: "assets/images/product/drink.png",
    price: 12.58,
  ),
];
