import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountComponent extends StatelessWidget {
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
                  width: AppSize.w(30),
                  height: AppSize.h(30),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f5f7),
                    borderRadius: BorderRadius.circular(AppSize.w(10)),
                  ),
                  child: Icon(Icons.remove, color: AppColors.primary),
                ),
              ),
              SizedBox(width: AppSize.w(15)),

              Text(
                quantity.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(width: AppSize.w(15)),
              // plus
              InkWell(
                onTap: () => cartCubit.incrementCounter(product.productId),
                child: Container(
                  width: AppSize.w(40),
                  height: AppSize.h(40),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSize.w(10)),
                  ),
                  child: Icon(Icons.add, color: Colors.white),
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
                width: AppSize.w(30),
                height: AppSize.h(30),
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f7),
                  borderRadius: BorderRadius.circular(AppSize.w(10)),
                ),
                child: Icon(Icons.remove, color: AppColors.primary),
              ),
            ),
            SizedBox(width: AppSize.w(15)),

            Text(
              product.quantity.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(width: AppSize.w(15)),
            // plus
            InkWell(
              onTap: () => cartCubit.incrementCounter(product.productId),
              child: Container(
                width: AppSize.w(40),
                height: AppSize.h(40),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSize.w(10)),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
