import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/searchView.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/change_search_state/change_search_state_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/changeselectedicon/changeselectedicon_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/search_by_price/search_bt_price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Customemainappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customemainappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeselectediconCubit, ChangeselectediconState>(
      builder: (context, state) {
        return state is Changeselectedicon && state.iconState != 'homeTab'
            ? SizedBox.shrink()
            : SizedBox(
                height: 85.h,
                child: AppBar(
                  backgroundColor: Dark.mainColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFadeInLeft(
                        duration: DurationFead.durationFeadIn,
                        child: Text(
                          LangKeys.chooseProducts.tr,
                          style: AppFonts.style24Bold.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      CustomFadeInRight(
                          child: Customelinearbutton(
                              onTap: () {
                                Get.to(
                                    curve: Curves.easeInCirc,
                                    duration: Duration(milliseconds: 700),
                                    () => MultiBlocProvider(providers: [
                                          BlocProvider<ChangeSearchStateCubit>(
                                            create: (context) =>
                                                ChangeSearchStateCubit(),
                                          ),
                                          BlocProvider<SearchBtPriceCubit>(
                                            create: (context) =>
                                                SearchBtPriceCubit(),
                                          )
                                        ], child: Searchview()));
                              },
                              child: SvgPicture.asset(AppImages.search),
                              width: 60.w,
                              height: 38.h,
                              colors: [Dark.blueDark, Dark.blueLight]),
                          duration: DurationFead.durationFeadIn)
                    ],
                  ),
                ),
              );
      },
    );
  }

  @override
  Size get preferredSize => Size(Get.size.width, 70.h);
}
