import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeDialog extends StatelessWidget {
  const CustomeDialog({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextApp(
            text: title,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: Get.width / 8, vertical: Get.height * 0.4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkDark!,
          ])),
    );
  }
}
