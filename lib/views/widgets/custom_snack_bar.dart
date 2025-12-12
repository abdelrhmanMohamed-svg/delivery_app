import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.white,

      content: Text(
        message,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: AppColors.primary),
      ),
    ),
  );
}
