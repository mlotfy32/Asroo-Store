import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomeRowProfile extends StatelessWidget {
  const CustomeRowProfile(
      {super.key,
      required this.icon,
      required this.title,
      required this.child});
  final String icon;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: context.color.textColor,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title.tr,
            style: AppFonts.f19w500.copyWith(
                fontWeight: FontWeight.w400, color: context.color.textColor),
          ),
          Spacer(),
          child
        ],
      ),
    );
  }
}
