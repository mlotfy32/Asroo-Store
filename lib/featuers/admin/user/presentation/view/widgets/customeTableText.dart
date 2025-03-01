import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomeTableText extends StatelessWidget {
  const CustomeTableText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textDirection: TextDirection.ltr,
      overflow: TextOverflow.clip,
      style: AppFonts.f19w500.copyWith(fontSize: 16),
    );
  }
}
