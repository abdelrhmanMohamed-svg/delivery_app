import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/cubits/cubit/favorite_action_cubit.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImageSection extends StatelessWidget with SU {
  const ProductDetailsImageSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final favoriteActionCubit = BlocProvider.of<FavoriteActionCubit>(context);
    return Stack(
      children: [
        ClipPath(
          clipper: BottomSCurveClipper(),
          child: Container(
            width: double.infinity,
            height: 320.h,
            color: Color(0xff2a2a2a),
            child: Image.asset(
              "assets/images/burger_background.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Back button
        Positioned(
          top: 40.h,
          left: 16.w,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.chevron_left, color: AppColors.white, size: 35.h),
          ),
        ),
        Positioned(
          top: 40.h,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              product.name,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        // Favorite button
        Positioned(
          top: 265.h,
          right: 60.w,
          child: BlocBuilder<FavoriteActionCubit, FavoriteActionState>(
            bloc: favoriteActionCubit,
            buildWhen: (previous, current) =>
                current is ToggleFavoriteAction ||
                current is FavoriteActionInitial,
            builder: (context, state) {
              if (state is ToggleFavoriteAction) {
                final isFav = state.isFav;
                return InkWell(
                  onTap: () => favoriteActionCubit.toggleIsFavoriteProduct(
                    product.productId,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFav ? AppColors.red : AppColors.lightGray,
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border_outlined,
                      color: AppColors.white,
                      size: 20.h,
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: () => favoriteActionCubit.toggleIsFavoriteProduct(
                  product.productId,
                ),
                child: Container(
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: product.isFavorite
                        ? AppColors.red
                        : AppColors.lightGray,
                  ),
                  child: Icon(
                    product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColors.white,
                    size: 20.h,
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

class BottomSCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height * 0.70);

    path.quadraticBezierTo(
      size.width * 0.98,
      size.height * 0.92,
      size.width * 0.75,
      size.height * 0.90,
    );

    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.86,
      0,
      size.height * 1.0,
    );

    // 5️⃣ Close bottom
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
