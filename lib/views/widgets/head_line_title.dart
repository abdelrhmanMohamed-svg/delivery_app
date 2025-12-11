import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HeadLineTitle extends StatelessWidget {
  const HeadLineTitle({
    super.key,
    required this.title,
    this.showActionText = false,
  });
  final String title;
  final bool showActionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (showActionText)
          TextButton(
            onPressed: () {},
            child: Text(
              "Ver todos",
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: AppColors.gray),
            ),
          ),
      ],
    );
  }
}
