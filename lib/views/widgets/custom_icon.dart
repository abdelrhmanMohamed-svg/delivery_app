import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            blurRadius: 0.5,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Icon(Icons.chevron_right_outlined, color: AppColors.darkBlue),
    );
  }
}
