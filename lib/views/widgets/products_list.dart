import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/views/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: AppSize.h(300),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dummyProducts.length,

              itemBuilder: (context, index) {
                final product = dummyProducts[index];
                return ProductListItem(product: product);
              },
            ),
          );
  }
}