import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/view_models/productDetails/product_details_cubit.dart';
import 'package:delivery_app/views/widgets/custom_main_button.dart';
import 'package:delivery_app/views/widgets/product_details_desc_section.dart';
import 'package:delivery_app/views/widgets/product_details_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
                    listener: (context, state) {
                      if (state is AddedToCartSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Producto agregado al carrito"),
                          ),
                        );
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
                          child: const CircularProgressIndicator.adaptive(),
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
                  SizedBox(width: AppSize.w(20)),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
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
