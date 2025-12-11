import 'package:delivery_app/models/category_model.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/head_line_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        children: [
          HeadLineTitle(title: "Explorar categorias", showActionText: true),

          SizedBox(height: AppSize.h(16)),
          SizedBox(
            height: AppSize.h(100),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dummyCategories.length,
              itemBuilder: (_, index) {
                final category = dummyCategories[index];
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
              },
            ),
          ),
          SizedBox(height: AppSize.h(25)),

          HeadLineTitle(title: "Productos populares"),
          SizedBox(height: AppSize.h(16)),
          SizedBox(
            height: AppSize.h(200),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dummyProducts.length,

              itemBuilder: (context, index) {
                final product = dummyProducts[index];
                return SizedBox(
                  width: AppSize.w(160),

                  child: Card(
                    color: AppColors.white,

                    margin: const EdgeInsets.only(right: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 10.0,
                          ),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.inActiveNavIconColor,
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: AppSize.h(120),
                              width: AppSize.w(120),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadowColor.withOpacity(
                                      0.5,
                                    ),
                                    blurRadius: 6,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                product.imageUrl,
                                height: AppSize.h(120),
                                width: AppSize.w(120),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
