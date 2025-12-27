import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountComponent extends StatelessWidget with SU {
  const CountComponent({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return BlocBuilder<CartCubit, CartState>(
      bloc: cartCubit,
      buildWhen: (previous, current) =>
          (current is CounterUpdate &&
              current.productId == product.productId) ||
          current is CartLoaded ||
          current is CartInitial,

      builder: (context, state) {
        if (state is CounterUpdate) {
          final quantity = state.quantity;
          return Row(
            children: [
              InkWell(
                onTap: () => cartCubit.decrementCounter(product.productId),
                child: Container(
                  padding: EdgeInsets.all(2.h),

                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f7),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: AppColors.primary,
                    size: 28.sp,
                  ),
                ),
              ),
              15.horizontalSpace,

              Text(quantity.toString(), style: AppTextStyles.lRegular),

              15.horizontalSpace,
              // plus
              InkWell(
                onTap: () => cartCubit.incrementCounter(product.productId),
                child: Container(
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 28.sp),
                ),
              ),
            ],
          );
        }
        return Row(
          children: [
            InkWell(
              onTap: () => cartCubit.decrementCounter(product.productId),
              child: Container(
                padding: EdgeInsets.all(2.h),

                decoration: BoxDecoration(
                  color: Color(0xfff5f5f7),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
            ),
            15.horizontalSpace,

            Text(product.quantity.toString(), style: AppTextStyles.lRegular),

            15.horizontalSpace,
            // plus
            InkWell(
              onTap: () => cartCubit.incrementCounter(product.productId),
              child: Container(
                padding: EdgeInsets.all(2.h),

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, color: Colors.white, size: 28.sp),
              ),
            ),
          ],
        );
      },
    );
  }
}
