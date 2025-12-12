import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/cubits/cubit/favorite_action_cubit.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedListItem extends StatelessWidget {
  const RecommendedListItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteActionCubit>(context);

    return Container(
      margin: EdgeInsets.only(right: AppSize.w(16)),
      width: AppSize.w(300),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: AppSize.w(90),
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.w(16),
                vertical: AppSize.h(15),
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
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
                            product.type,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppColors.lightGray),
                          ),
                          BlocBuilder<FavoriteActionCubit, FavoriteActionState>(
                            bloc: favoriteCubit,
                            buildWhen: (previous, current) =>
                                (current is ToggleFavoriteAction &&
                                current.productId == product.productId),
                            builder: (context, state) {
                              if (state is ToggleFavoriteAction) {
                                final isFav = state.isFav;
                                return InkWell(
                                  onTap: () => favoriteCubit.toggleIsFavorite(
                                    product.productId,
                                  ),
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
                                onTap: () => favoriteCubit.toggleIsFavorite(
                                  product.productId,
                                  true
                                  
                                ),
                                child: Icon(
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
                        ],
                      ),
                      SizedBox(height: AppSize.h(4)),
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppSize.h(2)),
                      Text(
                        product.subtitle,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.lightGray,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.h(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        "\$${product.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      CustomIcon(
                        onTap: () => Navigator.of(context, rootNavigator: true)
                            .pushNamed(
                              AppRoutes.itemDetailsPage,
                              arguments: product,
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
            bottom: -10,
            child: Image.asset(
              product.imageUrl,
              height: AppSize.h(140),
              width: AppSize.w(110),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
