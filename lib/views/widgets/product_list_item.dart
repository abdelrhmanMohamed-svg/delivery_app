import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.w(250),

      child: Card(
        color: AppColors.white,
        elevation: 2,

        margin: const EdgeInsets.only(right: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.inActiveNavIconColor,
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: AppSize.h(120),
                    width: AppSize.w(120),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor.withOpacity(0.33),
                          blurRadius: 6,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      product.imageUrl,
                      height: AppSize.h(120),
                      width: AppSize.w(120),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.h(25)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        product.description,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                      SizedBox(height: AppSize.h(8)),
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  CustomIcon(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
