import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CountComponent extends StatelessWidget {
  const CountComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSize.w(30),
          height: AppSize.h(30),
          decoration: BoxDecoration(
            color: Color(0xfff5f5f7),
            borderRadius: BorderRadius.circular(AppSize.w(10)),
          ),
          child: Icon(Icons.remove, color: AppColors.primary),
        ),
        SizedBox(width: AppSize.w(15)),
        Text("2", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(width: AppSize.w(15)),
        // plus
        Container(
          width: AppSize.w(40),
          height: AppSize.h(40),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppSize.w(10)),
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }
}
