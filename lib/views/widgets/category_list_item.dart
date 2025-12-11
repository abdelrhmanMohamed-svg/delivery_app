import 'package:delivery_app/models/category_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      padding: EdgeInsets.all(5),
                      height: AppSize.h(70),
                      width: AppSize.w(70),
                      decoration: BoxDecoration(
                        color: category.bgColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Image.asset(
                        category.imagePath,
                        fit: BoxFit.contain,
                        height: AppSize.h(40),
                        width: AppSize.w(40),
                      ),
                    ),
                    SizedBox(height: AppSize.h(8)),
                    Text(
                      category.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
  }
}