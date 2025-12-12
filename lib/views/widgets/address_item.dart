import 'package:delivery_app/models/address_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.address});
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w(160),
      margin: EdgeInsets.only(right: 7.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0),

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home, color: AppColors.white, size: 18),
          SizedBox(width: AppSize.w(8)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.city,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: AppColors.white),
              ),
              Text(
                address.street,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall!.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
