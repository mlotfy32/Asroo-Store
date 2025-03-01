import 'package:asroo_app/core/utiles/app_cubit/ChangeApp/changeApp_cubit.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';

class AdminMenue extends StatelessWidget {
  AdminMenue({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dark.blueDark,
      appBar: AppBar(
        centerTitle: true,
        title: TextApp(text: 'Asroo Store', theme: AppFonts.style24Bold),
        backgroundColor: Dark.blueDark,
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            itemCount: dashBoardItems.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                BlocProvider.of<ChangeAppCubit>(context)
                    .changeBody(index: index);
              },
              child: SizedBox(
                height: 50.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextApp(
                            text: dashBoardItems[index],
                            theme: AppFonts.dashBoardStyle),
                        Icon(
                          dashBoardIcons[index],
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

List<String> dashBoardItems = [
  'DashBoard',
  'Categories',
  'Products',
  'Users',
  'Notifications',
  'Logout'
];
List<IconData> dashBoardIcons = [
  Icons.dashboard,
  Icons.category_outlined,
  Icons.production_quantity_limits,
  Icons.people_alt_rounded,
  Icons.notifications_active,
  Icons.exit_to_app
];
