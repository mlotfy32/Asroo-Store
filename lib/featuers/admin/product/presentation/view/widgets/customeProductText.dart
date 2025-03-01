import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeProductText extends StatelessWidget {
  const CustomeProductText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: AppFonts.f19w500
          .copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp),
    );
  }
}
