import 'dart:developer';

import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/bottomPaint.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeAppbar.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeForm.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/login_welcomeText.dart';
import 'package:asroo_app/features/auth/signup/presentation/view/widgets/userAvatar.dart';
import 'package:asroo_app/features/auth/signup/presentation/viewModel/signup_cubit.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signupviewbody extends StatefulWidget {
  const Signupviewbody({super.key});

  @override
  State<Signupviewbody> createState() => _SignupviewbodyState();
}

class _SignupviewbodyState extends State<Signupviewbody> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    name.dispose();

    email.dispose();
    pass.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<String> imageUrl = [];
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Helper.FlutterToast(title: LangKeys.account_created, success: true);
          context.pushReplacementNamed(routName: 'login');
        } else if (state is SignupFailed) {
          Helper.FlutterToast(title: LangKeys.loggedError, success: false);
        }
      },
      child: Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.only(top: 40.h),
              children: [
                CustomeAppbar(),
                SizedBox(
                  height: 30.h,
                ),
                Login_welcomeText(
                  title: LangKeys.signUp.tr,
                  description: LangKeys.signUpWelcome.tr,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Useravatar(),
                SizedBox(
                  height: 15.h,
                ),
                customeform(
                  formKey: formKey,
                  name: name,
                  email: email,
                  pass: pass,
                  signUp: true,
                ),
                SizedBox(
                  height: 30.h,
                ),
                BlocListener<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is ImageSuccess) {
                      imageUrl.add(state.imageUrl);
                      Helper.FlutterToast(
                          title: 'Image Uploaded Successfully', success: true);
                    } else if (state is ImageFailure) {
                      Helper.FlutterToast(
                          title: 'Please try again', success: false);
                    }
                  },
                  child: Customelinearbutton(
                      colors: [
                        context.color.bluePinkLight!,
                        context.color.bluePinkDark!
                      ],
                      onTap: () async {
                        if (formKey.currentState!.validate() &&
                            imageUrl.isNotEmpty) {
                          log(imageUrl.first);

                          BlocProvider.of<SignupCubit>(context).SignUp(
                            imageUrl: imageUrl.first,
                            email: email.text,
                            pass: pass.text,
                            name: name.text,
                          );
                        }
                        if (imageUrl.isEmpty) {
                          Helper.FlutterToast(
                              title: LangKeys.validPickImage, success: false);
                        }
                      },
                      child: TextApp(
                          text: LangKeys.signUp.tr,
                          theme: context.textStyle.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      width: MediaQuery.sizeOf(context).width,
                      height: 40.h),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomFadeInRight(
                  duration: DurationFead.durationFeadIn,
                  child: TextButton(
                      onPressed: () =>
                          context.pushReplacementNamed(routName: 'login'),
                      child: TextApp(
                        text: LangKeys.youHaveAccount.tr,
                        theme: context.textStyle.copyWith(
                            fontSize: 17,
                            color: context.color.bluePinkLight!,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Bottompaint()),
    );
  }
}
