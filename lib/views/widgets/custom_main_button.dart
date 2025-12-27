import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMainButton extends StatelessWidget with SU {
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
        width: 200.w,
        height: 60.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: succeed
                ? [AppColors.lightGray, AppColors.gray]
                : [AppColors.primary, AppColors.notificationIconColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: buttonText != null
              ? Text(
                  buttonText!,
                  style: AppTextStyles.lMedium.copyWith(color: AppColors.white),
                )
              : child,
        ),
      ),
    );
  }
}
