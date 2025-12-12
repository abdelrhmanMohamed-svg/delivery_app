import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key, required this.product, required this.quantity});
  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final isNew = child.key == ValueKey(product.price * quantity);

        final slideAnimation = Tween<Offset>(
          begin: isNew ? Offset(0, -1) : Offset(0, 0),
          end: isNew ? Offset(0, 0) : Offset(0, 1),
        ).animate(animation);

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: Text(
        key: ValueKey(product.price * quantity),
        '\$${(product.price * quantity).toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.activeNavIconColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
