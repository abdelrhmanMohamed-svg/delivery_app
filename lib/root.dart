import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/view_models/cart/cart_cubit.dart';
import 'package:delivery_app/view_models/root/root_cubit.dart';
import 'package:delivery_app/views/pages/basket_page.dart';
import 'package:delivery_app/views/pages/favorite_page.dart';
import 'package:delivery_app/views/pages/home_page.dart';
import 'package:delivery_app/views/pages/profile_page.dart';
import 'package:delivery_app/views/pages/shop_page.dart';
import 'package:delivery_app/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Root extends StatelessWidget {
  const Root({super.key});
  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const HomePage(),
      item: ItemConfig(
        activeColorSecondary: AppColors.activeNavIconColor,
        inactiveForegroundColor: AppColors.inActiveNavIconColor,
        icon: const Icon(Icons.home_outlined),
      ),
    ),
    PersistentTabConfig(
      screen: const ShopPage(),
      item: ItemConfig(
        activeColorSecondary: AppColors.activeNavIconColor,
        inactiveForegroundColor: AppColors.inActiveNavIconColor,
        icon: const Icon(Icons.shopify_outlined),
      ),
    ),
    PersistentTabConfig(
      screen: BlocProvider(
        create: (context) {
          final cartCubit = CartCubit();
          cartCubit.fetchCartItems();
          return cartCubit;
        },
        child: const BasketPage(),
      ),
      item: ItemConfig(
        activeForegroundColor: AppColors.primary,

        icon: const Icon(
          Icons.shopping_basket_outlined,
          color: AppColors.white,
        ),
      ),
    ),
    PersistentTabConfig(
      screen: const FavoritePage(),
      item: ItemConfig(
        activeColorSecondary: AppColors.activeNavIconColor,
        inactiveForegroundColor: AppColors.inActiveNavIconColor,
        icon: const Icon(Icons.favorite_border_outlined),
      ),
    ),
    PersistentTabConfig(
      screen: const ProfilePage(),
      item: ItemConfig(
        activeColorSecondary: AppColors.activeNavIconColor,
        inactiveForegroundColor: AppColors.inActiveNavIconColor,
        icon: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(AppConstants.profileImage),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final rootCubit = BlocProvider.of<RootCubit>(context);
    AppSize.init(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: PersistentTabView(
          stateManagement: false,
          onTabChanged: (index) {
            rootCubit.changeTab(index);
          },
          tabs: _tabs(),
          navBarBuilder: (navBarConfig) =>
              Style15BottomNavBar(navBarConfig: navBarConfig),
        ),
      ),
    );
  }
}
