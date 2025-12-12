class IngredientesModel {
  final String id;
  final String title;
  final String imagePath;
  IngredientesModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });
}

final List<IngredientesModel> dummyIngredientes = [
  IngredientesModel(
    id: '1',
    title: 'Arrachera',
    imagePath: 'assets/images/ingredientes/arrachera.jpg',
  ),
  IngredientesModel(
    id: '2',
    title: 'Pan ajonjoli',
    imagePath: 'assets/images/ingredientes/pan_ajojoal.jpg',
  ),
  IngredientesModel(
    id: '3',
    title: 'Lechuga',
    imagePath: 'assets/images/ingredientes/lechuga.jpg',
  ),
  IngredientesModel(
    id: '4',
    title: 'Cebolla',
    imagePath: 'assets/images/ingredientes/cebolla.jpg',
  ),
  IngredientesModel(
    id: '5',
    title: 'Arrachera',
    imagePath: 'assets/images/ingredientes/arrachera.jpg',
  ),
];
