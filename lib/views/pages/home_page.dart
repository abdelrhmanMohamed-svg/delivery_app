import 'package:delivery_app/views/widgets/categories_list.dart';
import 'package:delivery_app/views/widgets/head_line_title.dart';
import 'package:delivery_app/views/widgets/products_list.dart';
import 'package:delivery_app/views/widgets/recommended_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.0.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // categories section
            HeadLineTitle(title: "Explorar categorias", showActionText: true),

            16.verticalSpace,
            CategoriesList(),
            25.verticalSpace,

            // products section
            HeadLineTitle(title: "Productos populares"),
            16.verticalSpace,
            ProductsList(),
            25.verticalSpace,
            // recommended section
            HeadLineTitle(title: "Recomendados"),
            16.verticalSpace,
            RecommendedList(),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
