import 'package:delivery_app/models/address_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/address_item.dart';
import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSize.w(320),
          height: AppSize.h(60),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyAddresses.length,
            itemBuilder: (context, index) {
              final address = dummyAddresses[index];
              return AddressItem(address: address);
            },
          ),
        ),

        const Spacer(),
        Container(
          width: AppSize.w(48),
          height: AppSize.h(48),
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
