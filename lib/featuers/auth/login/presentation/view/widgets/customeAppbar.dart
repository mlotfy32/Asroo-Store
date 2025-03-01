import 'package:asroo_app/core/utiles/app_cubit/ChangeApp/changeApp_cubit.dart';
import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:asroo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:asroo_app/core/utiles/durations.dart';

class CustomeAppbar extends StatelessWidget {
  const CustomeAppbar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: DurationFead.durationFeadIn,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocConsumer<ChangeAppCubit, ChangeAppState>(
            listener: (context, state) {
              if (state is Changelanguage) {
                // Language = state.language;
              }
            },
            builder: (context, state) {
              return Customelinearbutton(
                  colors: [
                    context.color.bluePinkLight!,
                    context.color.bluePinkDark!
                  ],
                  height: 40.h,
                  width: 80.w,
                  onTap: () async {
                    BlocProvider.of<ChangeAppCubit>(context).getSavedLanguage();
                  },
                  child: TextApp(
                      text: LangKeys.language.tr,
                      theme: context.textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)));
            },
          ),
          BlocConsumer<ChangeAppCubit, ChangeAppState>(
            listener: (context, state) {
              if (state is Changetheme) {
                mode = state.isDarkMode;
              }
            },
            builder: (context, state) {
              return Customelinearbutton(
                  colors: [
                    context.color.bluePinkLight!,
                    context.color.bluePinkDark!
                  ],
                  onTap: () {
                    BlocProvider.of<ChangeAppCubit>(context).chageTheme();
                  },
                  child: Icon(
                    mode == true
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    color: Colors.white,
                  ),
                  width: 60.w,
                  height: 40.h);
            },
          )
        ],
      ),
    );
  }
}
