import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:asroo_app/core/utiles/durations.dart';

class Customelinearbutton extends StatelessWidget {
  const Customelinearbutton(
      {super.key,
      required this.onTap,
      required this.child,
      required this.width,
      required this.height,
      required this.colors});
  final Function()? onTap;
  final Widget child;
  final double width;
  final double height;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration: DurationFead.durationFeadIn,
      child: InkWell(
        splashColor: context.color.bluePinkLight!.withOpacity(0.3),
        onTap: onTap,
        child: Container(
          width: width.w,
          height: height.h,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              gradient: LinearGradient(colors: colors)),
          child: Center(child: child),
        ),
      ),
    );
  }
}
