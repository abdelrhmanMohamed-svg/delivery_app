import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  CustomMainButton({
    super.key,
    this.onTap,
    this.buttonText,
    this.child,
    this.succeed = false,
  }) {
    assert(buttonText != null || child != null);
  }
  final VoidCallback? onTap;
  final String? buttonText;
  final Widget? child;
  final bool succeed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.w(200),
        height: AppSize.h(60),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: succeed
                ? [AppColors.lightGray, AppColors.gray]
                : [AppColors.primary, AppColors.notificationIconColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(AppSize.w(12)),
        ),
        child: Center(
          child: buttonText != null
              ? Text(
                  buttonText!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
