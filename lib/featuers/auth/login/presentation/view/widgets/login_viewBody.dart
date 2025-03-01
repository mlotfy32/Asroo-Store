import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/core/utiles/service/push_Notification/firebaseCloudMessaging.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/bottomPaint.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeAppbar.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeForm.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/login_welcomeText.dart';
import 'package:asroo_app/features/auth/login/presentation/viewmodel/login_cubit.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewbody extends StatefulWidget {
  const LoginViewbody({super.key});

  @override
  State<LoginViewbody> createState() => _LoginViewbodyState();
}

class _LoginViewbodyState extends State<LoginViewbody> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    notificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Helper.FlutterToast(
              title: LangKeys.loggedSuccessfully, success: true);
          email.text.split('@')[0] == 'admin'
              ? context.pushReplacementNamed(routName: 'admin')
              : context.pushReplacementNamed(routName: 'customer');
        } else if (state is LoginLoading) {
          isLoading = true;
        } else {
          Helper.FlutterToast(title: LangKeys.loggedError, success: false);
        }
      },
      child: Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.only(top: 50.h),
              children: [
                CustomeAppbar(),
                SizedBox(
                  height: 50,
                ),
                Login_welcomeText(
                  title: LangKeys.login.tr,
                  description: LangKeys.welcome.tr,
                ),
                SizedBox(
                  height: 40.h,
                ),
                //TODO:Optional constractor
                customeform(
                  formKey: formKey,
                  email: email,
                  pass: pass,
                  signUp: false,
                  name: email,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Customelinearbutton(
                    colors: [
                      context.color.bluePinkLight!,
                      context.color.bluePinkDark!
                    ],
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .LogIn(email: email.text, pass: pass.text);
                      }
                    },
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return state is LoginLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : TextApp(
                                text: LangKeys.login.tr,
                                theme: context.textStyle.copyWith(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700));
                      },
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    height: 40.h),
                SizedBox(
                  height: 40.h,
                ),
                CustomFadeInRight(
                  duration: DurationFead.durationFeadIn,
                  child: TextButton(
                      onPressed: () =>
                          context.pushReplacementNamed(routName: 'signup'),
                      child: TextApp(
                        text: LangKeys.createAccount.tr,
                        theme: context.textStyle.copyWith(
                            fontSize: 17,
                            color: context.color.bluePinkLight!,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       bottom: MediaQuery.viewInsetsOf(context).bottom),
                // )
              ],
            ),
          ),
          bottomNavigationBar: Bottompaint()),
    );
  }

  notificationPermission() async {
    await Firebasecloudmessaging().init();
  }
}
