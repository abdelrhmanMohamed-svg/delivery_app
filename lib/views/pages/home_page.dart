import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/views/widgets/categories_list.dart';
import 'package:delivery_app/views/widgets/head_line_title.dart';
import 'package:delivery_app/views/widgets/products_list.dart';
import 'package:delivery_app/views/widgets/recommended_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeadLineTitle(title: "Explorar categorias", showActionText: true),

            SizedBox(height: AppSize.h(16)),
            CategoriesList(),
            SizedBox(height: AppSize.h(25)),

            HeadLineTitle(title: "Productos populares"),
            SizedBox(height: AppSize.h(16)),
            ProductsList(),
            SizedBox(height: AppSize.h(25)),
            HeadLineTitle(title: "Recomendados"),
            SizedBox(height: AppSize.h(16)),
            RecommendedList(),
            SizedBox(height: AppSize.h(10)),
          ],
        ),
      ),
    );
  }
}
