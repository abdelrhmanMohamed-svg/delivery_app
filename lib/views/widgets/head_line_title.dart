import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadLineTitle extends StatelessWidget with SU {
  const HeadLineTitle({
    super.key,
    required this.title,
    this.showActionText = false,
    this.actionText = "Ver todos",
  });
  final String title;
  final bool showActionText;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          maxLines: 1,
          title,
          style: AppTextStyles.headingH5.copyWith(color: AppColors.darkBlue),
        ),
        if (showActionText)
          TextButton(
            onPressed: () {},
            child: Text(
              maxLines: 1,
              actionText,
              style: AppTextStyles.mMedium.copyWith(color: AppColors.gray),
            ),
          ),
      ],
    );
  }
}
