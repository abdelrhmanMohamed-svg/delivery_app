import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:delivery_app/views/widgets/address_row.dart';
import 'package:delivery_app/views/widgets/cart_item_list.dart';
import 'package:delivery_app/views/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    AppSize.init(context);

    return BlocBuilder<CartCubit, CartState>(
      bloc: cartCubit,
      buildWhen: (previous, current) =>
          current is CartLoaded || current is CartLoading,
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (state is CartLoaded) {
          final products = state.products;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.w(16)),
            child: Column(
              children: [
                SizedBox(height: AppSize.h(18)),

                //address row with add button
                AddressRow(),

                SizedBox(height: AppSize.h(50)),

                // Cart items list
                CartItemList(products: products),

                // Totals and action
                SummaryCard(),
                SizedBox(height: AppSize.h(20)),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
