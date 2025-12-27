import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:delivery_app/view_models/productDetails/product_details_cubit.dart';
import 'package:delivery_app/views/widgets/custom_main_button.dart';
import 'package:delivery_app/views/widgets/custom_snack_bar.dart';
import 'package:delivery_app/views/widgets/product_details_desc_section.dart';
import 'package:delivery_app/views/widgets/product_details_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productDetailsCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ProductDetailsImageSection(product: product),
            // Content section
            ProductDetailsDescSection(product: product),

            const Spacer(),
            // Bottom section with button and price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                    listener: (context, state) {
                      if (state is AddedToCartSuccess) {
                        customSnackBar(context, "Producto agregado");
                      }
                    },
                    listenWhen: (previous, current) =>
                        current is AddedToCartSuccess,
                    bloc: productDetailsCubit,
                    buildWhen: (previous, current) =>
                        current is AddedToCartSuccess ||
                        current is AddedToCartLoading,
                    builder: (context, state) {
                      if (state is AddedToCartLoading) {
                        return CustomMainButton(
                          onTap: null,
                          child: Transform.scale(
                            scale: 0.8.h,
                            child: const CircularProgressIndicator.adaptive(),
                          ),
                        );
                      }
                      if (state is AddedToCartSuccess) {
                        return CustomMainButton(
                          onTap: null,
                          buttonText: "Agregado al carrito",
                          succeed: true,
                        );
                      }
                      return CustomMainButton(
                        onTap: () {
                          productDetailsCubit.addToCart(product);
                        },
                        buttonText: "Ordenar ahora",
                      );
                    },
                  ),
                  20.horizontalSpace,
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: AppTextStyles.lSemiBold.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
