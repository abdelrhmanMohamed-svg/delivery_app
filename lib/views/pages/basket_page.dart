import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/views/widgets/address_row.dart';
import 'package:delivery_app/views/widgets/cart_item_list.dart';
import 'package:delivery_app/views/widgets/summary_card.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.w(16)),
      child: Column(
        children: [
          SizedBox(height: AppSize.h(18)),

          //address row with add button
          AddressRow(),

          SizedBox(height: AppSize.h(50)),

          // Cart items list
          CartItemList(),

          // Totals and action
          SummaryCard(),
          SizedBox(height: AppSize.h(20)),
        ],
      ),
    );
  }
}
