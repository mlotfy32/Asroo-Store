import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asroo_app/core/utiles/durations.dart';

class Login_welcomeText extends StatelessWidget {
  const Login_welcomeText({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomFadeInLeft(
          duration: DurationFead.durationFeadIn,
          child: TextApp(
              text: title,
              theme: context.textStyle
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 10,
        ),
        CustomFadeInRight(
          duration: DurationFead.durationFeadIn,
          child: TextApp(
              textAlign: TextAlign.center,
              text: description.tr,
              theme: context.textStyle
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
