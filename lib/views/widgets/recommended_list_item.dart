import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class RecommendedListItem extends StatelessWidget {
  const RecommendedListItem({super.key, required this.porduct});
  final ProductModel porduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(
        context,
        rootNavigator: true,
      ).pushNamed(AppRoutes.itemDetailsPage, arguments: porduct),
      child: Container(
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
                              porduct.type,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppColors.lightGray),
                            ),
                            Icon(
                              Icons.favorite_border_outlined,
                              color: AppColors.inActiveNavIconColor,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.h(4)),
                        Text(
                          porduct.name,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w500,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: AppSize.h(2)),
                        Text(
                          porduct.subtitle,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: AppColors.lightGray),
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

                          "\$${porduct.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        CustomIcon(
                          onTap: () =>
                              Navigator.of(
                                context,
                                rootNavigator: true,
                              ).pushNamed(
                                AppRoutes.itemDetailsPage,
                                arguments: porduct,
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
                porduct.imageUrl,
                height: AppSize.h(140),
                width: AppSize.w(110),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
