import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/views/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget with SU {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final list = dummyProducts
        .where((element) => !element.isRecommended)
        .toList();
    return SizedBox(
      height: 328.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,

        itemBuilder: (context, index) {
          final product = list[index];
          return ProductListItem(product: product);
        },
      ),
    );
  }
}
