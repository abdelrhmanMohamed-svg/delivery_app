import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.h(360),
      child: ListView.separated(
        clipBehavior: Clip.none,
        padding: EdgeInsets.only(top: AppSize.h(8)),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => SizedBox(width: AppSize.w(18)),
        itemBuilder: (context, index) {
          final product = products[index];
          return SizedBox(
            width: AppSize.w(265),
            child: CartItem(product: product),
          );
        },
      ),
    );
  }
}
