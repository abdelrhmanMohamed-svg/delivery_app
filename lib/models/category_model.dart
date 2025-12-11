import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String imagePath;
  final Color bgColor;

  CategoryModel({
    required this.title,
    required this.imagePath,
    required this.bgColor,
  });
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    title: "tacos",
    imagePath: "assets/images/category/tacos.png",
    bgColor: const Color(0xffD0E6A5),
  ),
  CategoryModel(
    title: "frias",
    imagePath: "assets/images/category/frias.png",
    bgColor: const Color(0xFF86E3CE),
  ),
  CategoryModel(
    title: "Burger",
    imagePath: "assets/images/category/burger.png",
    bgColor: const Color(0xffFFDD95),
  ),

  CategoryModel(
    title: "Pizza",
    imagePath: "assets/images/category/pizza.png",
    bgColor: const Color(0xffFFACAC),
  ),
  CategoryModel(
    title: "Burritos",
    imagePath: "assets/images/category/Burritos.png",
    bgColor: const Color(0xffCCAAD9),
  ),
];
