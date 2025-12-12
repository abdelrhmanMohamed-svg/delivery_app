import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/count_component.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
                  CountComponent(),
                  // price
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.activeNavIconColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // delete badge
        Positioned(
          top: -AppSize.h(15),
          right: AppSize.w(10),
          child: Container(
            width: AppSize.w(40),
            height: AppSize.h(50),
            decoration: BoxDecoration(
              color: Color(0xffF02756),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.delete, color: Colors.white, size: AppSize.w(18)),
          ),
        ),
      ],
    );
  }
}
