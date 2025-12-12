import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/views/widgets/recommended_list_item.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.h(140),
      width: double.infinity,
      child: ListView.builder(
        itemCount: dummyDrinks.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final drink = dummyDrinks[index];
          return RecommendedListItem(product: drink);
        },
      ),
    );
  }
}
