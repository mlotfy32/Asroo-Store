import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/3.3%20custom_text_field.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customeform extends StatelessWidget {
  const customeform({
    super.key,
    required this.email,
    required this.pass,
    required this.signUp,
    required this.name,
    required this.formKey,
  });
  final TextEditingController name;
  final Key formKey;
  final TextEditingController email;
  final TextEditingController pass;
  final bool signUp;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            signUp
                ? CustomFadeInRight(
                    duration: DurationFead.durationFeadIn,
                    child: CustomTextField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return LangKeys.validName.tr;
                        }
                      },
                      hintText: LangKeys.fullName.tr,
                      hintStyle: context.textStyle.copyWith(fontSize: 16.sp),
                    ))
                : SizedBox(),
            SizedBox(
              height: 30.h,
            ),
            CustomFadeInLeft(
              duration: DurationFead.durationFeadIn,
              child: CustomTextField(
                validator: (value) {
                  if (value!.isEmpty || value.contains('@gmail.com') == false) {
                    return LangKeys.validEmail.tr;
                  }
                },
                controller: email,
                keyboardType: TextInputType.emailAddress,
                hintText: LangKeys.email.tr,
                hintStyle: context.textStyle.copyWith(fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomFadeInRight(
              duration: DurationFead.durationFeadIn,
              child: CustomTextField(
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return LangKeys.validPasswrod.tr;
                  }
                },
                hintText: LangKeys.password.tr,
                hintStyle: context.textStyle.copyWith(fontSize: 16.sp),
                controller: pass,
                obscureText: true,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ));
  }
}
