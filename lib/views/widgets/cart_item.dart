import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:delivery_app/views/widgets/animated_text.dart';
import 'package:delivery_app/views/widgets/count_component.dart';
import 'package:delivery_app/views/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget with SU {
  const CartItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image centered
              Image.asset(product.imageUrl, fit: BoxFit.contain, height: 100.h),
              10.verticalSpace,
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                product.name,
                textAlign: TextAlign.center,
                style: AppTextStyles.headingH5.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              8.verticalSpace,
              Text(
                product.description,
                textAlign: TextAlign.center,
                style: AppTextStyles.sMedium.copyWith(
                  color: AppColors.lightGray,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              25.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: CountComponent(product: product)),
                  // price
                  BlocBuilder<CartCubit, CartState>(
                    bloc: cartCubit,
                    buildWhen: (previous, current) =>
                        (current is CounterUpdate &&
                            current.productId == product.productId) ||
                        current is CartLoaded,
                    builder: (context, state) {
                      if (state is CounterUpdate) {
                        return AnimatedText(
                          product: product,
                          quantity: state.quantity,
                        );
                      }
                      return AnimatedText(
                        product: product,
                        quantity: product.quantity,
                      );
                    },
                  ),
                ],
              ),
              5.verticalSpace,
            ],
          ),
        ),
        // delete icon
        Positioned(
          top: -10.h,
          right: 10.w,
          child: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is DeleteProduct) {
                customSnackBar(context, "Producto eliminado");
              }
            },
            bloc: cartCubit,
            buildWhen: (previous, current) =>
                current is DeleteProduct || current is CartLoaded,
            builder: (context, state) {
              return InkWell(
                onTap: () => cartCubit.deleteProduct(product.productId),
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  width: 35.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/noun_Trash_3513304.png",
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
