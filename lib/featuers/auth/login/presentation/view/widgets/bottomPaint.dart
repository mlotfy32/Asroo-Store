import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_printer.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter/material.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bottompaint extends StatelessWidget {
  const Bottompaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: DurationFead.durationFeadIn,
      child: Padding(
        padding: EdgeInsets.zero,
        child: CustomPaint(
          size: Size(MediaQuery.sizeOf(context).width, 60.0.h),
          painter: AuthCustomPainter(
              gradient: LinearGradient(colors: [
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkDark!,
          ])),
        ),
      ),
    );
  }
}
