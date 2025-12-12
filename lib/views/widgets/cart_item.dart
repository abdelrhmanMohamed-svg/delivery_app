import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:delivery_app/views/widgets/animated_text.dart';
import 'package:delivery_app/views/widgets/count_component.dart';
import 'package:delivery_app/views/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(
            vertical: AppSize.h(20),
            horizontal: AppSize.w(20),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.w(20)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image centered
              Image.asset(
                product.imageUrl,
                fit: BoxFit.contain,
                height: AppSize.h(110),
                width: AppSize.w(110),
              ),
              SizedBox(height: AppSize.h(10)),
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppSize.h(8)),
              Text(
                product.description,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.lightGray),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppSize.h(25)),
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
            ],
          ),
        ),
        // delete icon
        Positioned(
          top: -AppSize.h(15),
          right: AppSize.w(10),
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
                  padding: EdgeInsets.all(8),
                  width: AppSize.w(40),
                  height: AppSize.h(50),
                  decoration: BoxDecoration(
                    color: Color(0xffF02756),
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
