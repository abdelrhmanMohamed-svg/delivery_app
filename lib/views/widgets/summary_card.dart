import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:delivery_app/views/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: BlocBuilder<CartCubit, CartState>(
        bloc: cartCubit,
        buildWhen: (previous, current) =>
            current is UpdateTotal || current is CartLoaded,
        builder: (context, state) {
          if(state is  UpdateTotal){
            final totalPriceState = state.totalPrice;
            return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SubTotal:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(height: AppSize.h(6)),
                      Text(
                        'Envio:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${totalPriceState.toStringAsFixed(2)} usd',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSize.h(6)),
                      Text(
                        'Gratis',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.h(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$${totalPriceState.toStringAsFixed(2)} usd',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.h(12)),
              CustomMainButton(onTap: () {}, buttonText: 'Realizar compra'),
            ],
          );

          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SubTotal:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(height: AppSize.h(6)),
                      Text(
                        'Envio:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)} usd',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppSize.h(6)),
                      Text(
                        'Gratis',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.h(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)} usd',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.h(12)),
              CustomMainButton(onTap: () {}, buttonText: 'Realizar compra'),
            ],
          );
        },
      ),
    );
  }
}
