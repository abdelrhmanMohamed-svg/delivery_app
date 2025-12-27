import 'package:delivery_app/models/category_model.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListItem extends StatelessWidget with SU {
  const CategoryListItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          padding: EdgeInsets.all(8.0.h),
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: category.bgColor,
            borderRadius: BorderRadius.circular(16.0.r),
          ),
          child: Image.asset(
            category.imagePath,
            fit: BoxFit.contain,
            height: 40.h,
            width: 40.w,
          ),
        ),
        10.verticalSpace,
        Text(maxLines: 1, category.title, style: AppTextStyles.mMedium),
      ],
    );
  }
}
