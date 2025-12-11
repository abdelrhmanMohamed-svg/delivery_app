import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/app_size.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/views/pages/basket_page.dart';
import 'package:delivery_app/views/pages/favorite_page.dart';
import 'package:delivery_app/views/pages/home_page.dart';
import 'package:delivery_app/views/pages/profile_page.dart';
import 'package:delivery_app/views/pages/shop_page.dart';
import 'package:flutter/material.dart';
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
      screen: const BasketPage(),
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
    AppSize.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppSize.w(132),
                  height: AppSize.h(35),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.primary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      filled: true,
                      fillColor: AppColors.backgorund,
                    ),
                  ),
                ),
                SizedBox(width: AppSize.w(6)),
                Text(
                  "Inicio",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.notificationIconColor,
                ),
                SizedBox(width: AppSize.w(10)),

                Image.asset(
                  AppConstants.settingsIcon,
                  width: AppSize.w(24),
                  height: AppSize.h(24),
                  color: AppColors.settingsIconColor,
                ),
              ],
            ),
          ],
        ),
      ),
      body: PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) =>
            Style15BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
