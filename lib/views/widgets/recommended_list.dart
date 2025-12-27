import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/views/widgets/recommended_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedList extends StatelessWidget with SU {
  const RecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    final list = dummyProducts
        .where((element) => element.isRecommended)
        .toList();
    return SizedBox(
      height: 140.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final drink = list[index];
          return RecommendedListItem(drink: drink);
        },
      ),
    );
  }
}
