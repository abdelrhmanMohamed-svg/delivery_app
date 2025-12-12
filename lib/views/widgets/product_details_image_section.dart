import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSection extends StatelessWidget {
  const ProductDetailsImageSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CurvedClipper(),
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
          top: AppSize.h(275),
          right: AppSize.w(80),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(AppSize.w(12)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.red,
              ),
              child: Icon(
                Icons.favorite_border_outlined,
                color: AppColors.white,
                size: AppSize.h(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.7); // Start on the left side

    // 1. Downward curve on the left
    final firstControlPoint = Offset(size.width * 0.2, size.height * 0.8);
    final firstEndPoint = Offset(size.width * 0.35, size.height * 0.8);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    // 2. Straight line in the middle
    path.lineTo(size.width * 0.65, size.height * 0.8);

    // 3. Upward curve on the right
    final secondControlPoint = Offset(size.width * 0.8, size.height * 0.8);
    final secondEndPoint = Offset(size.width, size.height * 0.7);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0); // Go to top-right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
