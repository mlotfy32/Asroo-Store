import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerLinearAdmin extends StatelessWidget {
  const CustomContainerLinearAdmin({
    required this.height,
    required this.width,
    required this.child,
    super.key,
    required this.marginh,
    required this.marginv,
    required this.paddingh,
    required this.paddingv,
  });

  final double height;
  final double width;
  final Widget child;
  final double marginh;
  final double marginv;
  final double paddingh;
  final double paddingv;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: marginv.h, horizontal: marginh.w),
      padding:
          EdgeInsets.symmetric(horizontal: paddingh.w, vertical: paddingv.h),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Dark.black1.withOpacity(0.8),
            Dark.black2.withOpacity(0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            color: Dark.black1.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Dark.black2.withOpacity(0.3),
            offset: const Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
