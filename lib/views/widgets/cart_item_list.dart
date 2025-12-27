import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemList extends StatelessWidget with SU {
  const CartItemList({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: ListView.separated(
        clipBehavior: Clip.none,
        padding: EdgeInsets.only(top: 8.h),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => SizedBox(width: 18.w),
        itemBuilder: (context, index) {
          final product = products[index];
          return SizedBox(
            width: 260.w,
            child: CartItem(product: product),
          );
        },
      ),
    );
  }
}
