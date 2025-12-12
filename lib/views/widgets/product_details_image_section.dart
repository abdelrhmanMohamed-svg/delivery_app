import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/cubits/cubit/favorite_action_cubit.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsImageSection extends StatelessWidget {
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
            height: AppSize.h(380),
            color: Color(0xff2a2a2a),
            child: Image.asset(
              "assets/images/burger_background.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Back button
        Positioned(
          top: AppSize.h(40),
          left: AppSize.w(16),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: AppColors.white,
              size: AppSize.h(35),
            ),
          ),
        ),
        Positioned(
          top: AppSize.h(40),
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
          top: AppSize.h(315),
          right: AppSize.w(50),
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
                    padding: EdgeInsets.all(AppSize.w(12)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFav ? AppColors.red : AppColors.lightGray,
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border_outlined,
                      color: AppColors.white,
                      size: AppSize.h(20),
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: () => favoriteActionCubit.toggleIsFavoriteProduct(
                  product.productId,
                ),
                child: Container(
                  padding: EdgeInsets.all(AppSize.w(12)),
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
                    size: AppSize.h(20),
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

    // 1️⃣ Top straight line
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // 2️⃣ Down near bottom (before starting curve)
    path.lineTo(size.width, size.height * 0.70);

    // 3️⃣ Right curve (much closer to the right corner)
    path.quadraticBezierTo(
      size.width * 0.98, // X control (قريب جدًا من اليمين)
      size.height * 0.92, // Y control
      size.width * 0.75, // نهاية الكيرف أقرب للزاوية
      size.height * 0.90,
    );

    // 4️⃣ Left curve (قريب من الكورنر الشمال)
    path.quadraticBezierTo(
      size.width * 0.1, // control point قربناه للشمال
      size.height * 0.86,
      0, // نهاية في كورنر الشمال
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
