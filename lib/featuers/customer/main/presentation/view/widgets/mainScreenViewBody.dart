import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/service/push_Notification/localNotification.dart';
import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/customer/category/presentation/view/categoryView.dart';
import 'package:asroo_app/features/customer/favorite/presentation/view/favoriteView.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/customeFloatingButton.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/productDetailes.dart';
import 'package:asroo_app/features/customer/profile/presentation/view/profileView.dart';
import 'package:asroo_app/features/customer/home/presentation/view/homeView.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/customeMainAppBar.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/changeselectedicon/changeselectedicon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Mainscreenviewbody extends StatefulWidget {
  const Mainscreenviewbody({super.key});

  @override
  State<Mainscreenviewbody> createState() => _MainscreenviewbodyState();
}

class _MainscreenviewbodyState extends State<Mainscreenviewbody> {
  final controller = ScrollController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomeFloatingButton(
        controller: controller,
      ),
      appBar: Customemainappbar(),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(context.asset.homeBg!),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Expanded(child: BlocBuilder<ChangeselectediconCubit,
                    ChangeselectediconState>(
                  builder: (context, state) {
                    if (state is Changeselectedicon &&
                        state.iconState == 'homeTab') {
                      return Homeview(
                        controller: controller,
                      );
                    } else if (state is Changeselectedicon &&
                        state.iconState == 'categoriesTab') {
                      return BlocProvider<GetallcategoriesCubit>(
                        create: (context) => GetallcategoriesCubit(),
                        child: Categoryview(
                          title: '',
                          id: '',
                        ),
                      );
                    } else if (state is Changeselectedicon &&
                        state.iconState == 'favouritesTab') {
                      return Favoriteview(
                        productId: 0,
                      );
                    } else if (state is Changeselectedicon &&
                        state.iconState == 'profileTab') {
                      return Profileview();
                    }
                    return Homeview(
                      controller: controller,
                    );
                  },
                )),
              ],
            ),
          ),
          BottomNavBar(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.bigIconNavBarDark))),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 40.w, bottom: 55.h),
              child: SvgPicture.asset(
                AppImages.carShop,
                color: Colors.white,
                height: 20.h,
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
