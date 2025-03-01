import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeSearchRow extends StatelessWidget {
  const CustomeSearchRow(
      {super.key, required this.state, this.onNameTap, this.onPriceTap});
  final String state;
  final Function()? onNameTap;
  final Function()? onPriceTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Customelinearbutton(
            onTap: onNameTap,
            child: Text(
              'Search Name',
              style: AppFonts.f19w500,
            ),
            width: 150.w,
            height: 50.h,
            colors: state == 'name'
                ? [
                    Dark.blueLight,
                    Dark.blueDark,
                  ]
                : [Dark.navBarDark, Dark.navBarDark]),
        Customelinearbutton(
            onTap: onPriceTap,
            child: Text(
              'Search Price',
              style: AppFonts.f19w500,
            ),
            width: 150.w,
            height: 50.h,
            colors: state == 'price'
                ? [
                    Dark.blueLight,
                    Dark.blueDark,
                  ]
                : [Dark.navBarDark, Dark.navBarDark])
      ],
    );
  }
}
