import 'package:delivery_app/utils/app_constants.dart';
import 'package:delivery_app/utils/router/app_routes.dart';
import 'package:delivery_app/utils/theme/app_colors.dart';
import 'package:delivery_app/view_models/root/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    final rootCubit = BlocProvider.of<RootCubit>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        child: BlocBuilder<RootCubit, RootState>(
          bloc: rootCubit,
          buildWhen: (previous, current) =>
              current is RootTabChanged || current is RootInitial,

          builder: (context, state) {
            if (state is RootTabChanged) {
              selectedIndex = state.selectedIndex;
            }

            if (selectedIndex == 2) {
              return Center(
                child: Text(
                  "Carrito",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.searchPageRoute),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          width: 140.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(),
                          ),
                          child: Icon(Icons.search, color: AppColors.primary),
                        ),
                      ),
                      6.horizontalSpace,
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
                        size: 26,
                      ),
                      10.horizontalSpace,

                      Image.asset(
                        AppConstants.settingsIcon,
                        width: 24.w,
                        height: 24.h,
                        color: AppColors.settingsIconColor,
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
