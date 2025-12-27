import 'package:delivery_app/models/category_model.dart';
import 'package:delivery_app/views/widgets/category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget with SU {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategories.length,
        itemBuilder: (_, index) {
          final category = dummyCategories[index];
          return CategoryListItem(category: category);
        },
      ),
    );
  }
}
