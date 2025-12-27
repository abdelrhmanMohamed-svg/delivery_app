import 'package:delivery_app/models/address_model.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressItem extends StatelessWidget with SU {
  const AddressItem({super.key, required this.address});
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7.0.h),
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 5.0.h),

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.0.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home, color: AppColors.white, size: 22.h),
          8.horizontalSpace,
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.city,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.sRegular.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  address.street,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.sRegular.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
