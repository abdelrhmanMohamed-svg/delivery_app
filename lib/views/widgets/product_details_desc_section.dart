import 'package:delivery_app/models/ingredientes_model.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/widgets/head_line_title.dart';
import 'package:flutter/material.dart';

class ProductDetailsDescSection extends StatelessWidget {
  const ProductDetailsDescSection({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.w(16),
        vertical: AppSize.h(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description section
          Text(
            "Descripción",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkBlue,
            ),
          ),
          SizedBox(height: AppSize.h(12)),
          Text(
            product.description,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.darkBlue),
          ),
          SizedBox(height: AppSize.h(24)),
          // Ingredients section
          HeadLineTitle(
            title: "Ingredientes",
            showActionText: true,
            actionText: "10 Ingredientes",
          ),
          SizedBox(height: AppSize.h(12)),
          SizedBox(
            height: AppSize.h(110),
            child: ListView.builder(
              itemCount: dummyIngredientes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final ingrediente = dummyIngredientes[index];
                return Padding(
                  padding: EdgeInsets.only(right: AppSize.w(12)),
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
          width: AppSize.w(80),
          height: AppSize.h(80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.w(12)),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: AppSize.h(8)),
        Text(
          name,
          style:Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.lightGray),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
