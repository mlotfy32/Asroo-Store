import 'package:asroo_app/core/utiles/app_cubit/ChangeApp/changeApp_cubit.dart';
import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/icon_Nav_Bar.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/changeselectedicon/changeselectedicon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: Get.size.width,
            height: 55.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 55.h,
                  color: context.color.navBarbg,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 45.h,
                      width: Get.size.width - 80.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: BlocBuilder<ChangeselectediconCubit,
                            ChangeselectediconState>(
                          builder: (context, state) {
                            if (state is Changeselectedicon) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconNavBar(
                                    onTap: () {
                                      BlocProvider.of<ChangeselectediconCubit>(
                                              context)
                                          .changeSelectedIcon(
                                              stateName: 'homeTab');
                                    },
                                    icon: AppImages.homeTab,
                                    isSelected: state.iconState == 'homeTab'
                                        ? true
                                        : false,
                                  ),
                                  IconNavBar(
                                    onTap: () {
                                      BlocProvider.of<ChangeselectediconCubit>(
                                              context)
                                          .changeSelectedIcon(
                                              stateName: 'categoriesTab');
                                    },
                                    icon: AppImages.categoriesTab,
                                    isSelected:
                                        state.iconState == 'categoriesTab'
                                            ? true
                                            : false,
                                  ),
                                  IconNavBar(
                                    onTap: () {
                                      BlocProvider.of<ChangeselectediconCubit>(
                                              context)
                                          .changeSelectedIcon(
                                              stateName: 'favouritesTab');
                                    },
                                    icon: AppImages.favouritesTab,
                                    isSelected:
                                        state.iconState == 'favouritesTab'
                                            ? true
                                            : false,
                                  ),
                                  IconNavBar(
                                    onTap: () {
                                      BlocProvider.of<ChangeselectediconCubit>(
                                              context)
                                          .changeSelectedIcon(
                                              stateName: 'profileTab');
                                    },
                                    icon: AppImages.profileTab,
                                    isSelected: state.iconState == 'profileTab'
                                        ? true
                                        : false,
                                  ),
                                ],
                              );
                            }
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconNavBar(
                                  onTap: () {
                                    BlocProvider.of<ChangeselectediconCubit>(
                                            context)
                                        .changeSelectedIcon(
                                            stateName: 'homeTab');
                                  },
                                  icon: AppImages.homeTab,
                                  isSelected: true,
                                ),
                                IconNavBar(
                                  onTap: () {
                                    BlocProvider.of<ChangeselectediconCubit>(
                                            context)
                                        .changeSelectedIcon(
                                            stateName: 'categoriesTab');
                                  },
                                  icon: AppImages.categoriesTab,
                                  isSelected: false,
                                ),
                                IconNavBar(
                                  onTap: () {
                                    BlocProvider.of<ChangeselectediconCubit>(
                                            context)
                                        .changeSelectedIcon(
                                            stateName: 'favouritesTab');
                                  },
                                  icon: AppImages.favouritesTab,
                                  isSelected: false,
                                ),
                                IconNavBar(
                                  onTap: () {
                                    BlocProvider.of<ChangeselectediconCubit>(
                                            context)
                                        .changeSelectedIcon(
                                            stateName: 'profileTab');
                                  },
                                  icon: AppImages.profileTab,
                                  isSelected: false,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        duration: DurationFead.durationFeadIn);
  }
}
