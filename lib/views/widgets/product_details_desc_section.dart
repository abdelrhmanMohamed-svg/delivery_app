import 'package:delivery_app/models/ingredientes_model.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/utils/theme/app_text_styles.dart';
import 'package:delivery_app/views/widgets/head_line_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsDescSection extends StatelessWidget with SU {
  const ProductDetailsDescSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description section
          Text(
            "Descripción",
            style: AppTextStyles.lSemiBold.copyWith(color: AppColors.darkBlue),
          ),
          10.verticalSpace,
          Text(
            product.description,
            style: AppTextStyles.sRegular.copyWith(color: AppColors.darkBlue),
          ),
          // Ingredients section
          HeadLineTitle(
            title: "Ingredientes",
            showActionText: true,
            actionText: "10 Ingredientes",
          ),
          5.verticalSpace,
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              itemCount: dummyIngredientes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final ingrediente = dummyIngredientes[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: _buildIngredientCard(
                    context,
                    ingrediente.title,
                    ingrediente.imagePath,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientCard(BuildContext context, String name, String image) {
    return Column(
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        5.verticalSpace,
        Text(
          name,
          style: AppTextStyles.sRegular.copyWith(color: AppColors.lightGray),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
