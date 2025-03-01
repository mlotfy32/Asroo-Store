import 'package:asroo_app/core/utiles/appLogOut.dart';
import 'package:asroo_app/core/utiles/customeWepView.dart';
import 'package:asroo_app/core/utiles/env_variables.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:asroo_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:asroo_app/main.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import 'package:get/get.dart';
part 'changeApp_state.dart';

class ChangeAppCubit extends Cubit<ChangeAppState> {
  ChangeAppCubit() : super(ChangeAppInitial());
  bool isDark = true;
  Future<void> chageTheme() async {
    var mood = await SharedPref().getBoolean(PrefsKeys.themeMode);

    if (mood != null) {
      isDark = mood == true ? false : true;
      await SharedPref().setBoolean(PrefsKeys.themeMode, isDark).then((value) {
        emit(Changetheme(isDarkMode: isDark));
      });
    } else {
      await SharedPref().setBoolean(PrefsKeys.themeMode, true).then((value) {
        emit(Changetheme(isDarkMode: true));
      });
    }
  }

  void onTap({required int index, required BuildContext context}) {
    switch (index) {
      case 0:
        BlocProvider.of<ChangeAppCubit>(context).getSavedLanguage();

        break;
      case 1:
        BlocProvider.of<ChangeAppCubit>(context).chageTheme();
        break;
      case 2:
        Get.to(() => Customewebview(
              url: EnvVariable.instance.buildDeveloper,
            ));
        break;
      case 5:
        Helper.customeDialog(
          left: 'Cansel',
          right: 'Sure',
          onTap: () {
            Applogout().logout();
          },
        );
        break;
      default:
    }
  }

  getSavedLanguage() async {
    var language = SharedPref().getString(PrefsKeys.language);
    if (language != null) {
      if (language == 'en') {
        await SharedPref().setString(PrefsKeys.language, 'ar');
        Get.updateLocale(Locale('ar'));
        return 'ar';
      } else {
        await SharedPref().setString(PrefsKeys.language, 'en');

        Get.updateLocale(Locale('en'));
        return 'en';
      }
    } else {
      await SharedPref().setString(PrefsKeys.language, 'en');

      Get.updateLocale(Locale('en'));
      return 'en';
    }
  }

  changeBody({required int index}) {
    emit(Changeadminbody(currentAdmin: index));
    log('emited ${index}');
  }
}
