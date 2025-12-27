import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/cubits/cubit/favorite_action_cubit.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:delivery_app/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListItem extends StatelessWidget with SU {
  const ProductListItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteActionCubit>(context);
    return SizedBox(
      width: 260.w,

      child: Card(
        color: AppColors.white,
        elevation: 2,

        margin: EdgeInsets.only(right: 15.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: BlocBuilder<FavoriteActionCubit, FavoriteActionState>(
                  bloc: favoriteCubit,
                  buildWhen: (previous, current) =>
                      (current is ToggleFavoriteAction &&
                      current.productId == product.productId),
                  builder: (context, state) {
                    if (state is ToggleFavoriteAction) {
                      final isFav = state.isFav;
                      return InkWell(
                        onTap: () => favoriteCubit.toggleIsFavoriteProduct(
                          product.productId,
                        ),
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav
                              ? AppColors.red
                              : AppColors.inActiveNavIconColor,
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () => favoriteCubit.toggleIsFavoriteProduct(
                        product.productId,
                      ),
                      child: Icon(
                        size: 25.h,
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavorite
                            ? AppColors.red
                            : AppColors.inActiveNavIconColor,
                      ),
                    );
                  },
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 117.h,
                    width: 117.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor.withValues(alpha: 0.33),
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
                      height: 120.h,
                      width: 120.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              25.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: AppTextStyles.lMedium.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        product.subtitle,
                        style: AppTextStyles.mMedium.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: AppTextStyles.headingH6.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  CustomIcon(
                    onTap: () => Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed(AppRoutes.itemDetailsPage, arguments: product),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
