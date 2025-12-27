import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/cubits/cubit/favorite_action_cubit.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:delivery_app/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedListItem extends StatelessWidget with SU {
  const RecommendedListItem({super.key, required this.drink});
  final ProductModel drink;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteActionCubit>(context);

    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 300.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 90.w,
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.0.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            drink.type,
                            style: AppTextStyles.mMedium.copyWith(
                              color: AppColors.lightGray,
                            ),
                          ),
                          BlocBuilder<FavoriteActionCubit, FavoriteActionState>(
                            bloc: favoriteCubit,
                            buildWhen: (previous, current) =>
                                (current is ToggleFavoriteAction &&
                                current.productId == drink.productId),
                            builder: (context, state) {
                              if (state is ToggleFavoriteAction) {
                                final isFav = state.isFav;
                                return InkWell(
                                  onTap: () => favoriteCubit
                                      .toggleIsFavoriteProduct(drink.productId),
                                  child: Icon(
                                    isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFav
                                        ? AppColors.red
                                        : AppColors.inActiveNavIconColor,
                                  ),
                                );
                              }
                              return InkWell(
                                onTap: () => favoriteCubit
                                    .toggleIsFavoriteProduct(drink.productId),
                                child: Icon(
                                  size: 25.h,
                                  drink.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: drink.isFavorite
                                      ? AppColors.red
                                      : AppColors.inActiveNavIconColor,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      Text(
                        drink.name,
                        style: AppTextStyles.lMedium.copyWith(
                          color: AppColors.darkBlue,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      2.verticalSpace,
                      Text(
                        drink.subtitle,
                        style: AppTextStyles.sMedium.copyWith(
                          color: AppColors.lightGray,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        "\$${drink.price.toStringAsFixed(2)}",
                        style: AppTextStyles.headingH6.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      CustomIcon(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                              AppRoutes.itemDetailsPage,
                              arguments: drink,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: -20.h,
            child: Image.asset(
              drink.imageUrl,
              height: 140.h,
              width: 100.w,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
