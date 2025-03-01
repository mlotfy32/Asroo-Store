import 'package:asroo_app/core/utiles/connectivity_controller.dart';
import 'package:asroo_app/core/utiles/env_variables.dart';
import 'package:asroo_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:asroo_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:asroo_app/features/auth/signup/presentation/viewModel/signup_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/changerunnerindex/changerunnerindex_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/getone/getone_cubit.dart';
import 'package:asroo_app/features/customer/noInternet_connection/presentation/view/no_InternetView.dart';
import 'package:asroo_app/main.dart';
import 'package:asroo_app/core/utiles/app_cubit/ChangeApp/changeApp_cubit.dart';
import 'package:asroo_app/core/utiles/language/local.dart';
import 'package:asroo_app/core/utiles/routes/app_routes.dart';
import 'package:asroo_app/core/utiles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnect,
      builder: (_, value, __) {
        if (value) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ChangeAppCubit>(
                  create: (context) => ChangeAppCubit()),
              BlocProvider<GetoneCubit>(create: (context) => GetoneCubit()),
              BlocProvider<ChangerunnerindexCubit>(
                  create: (context) => ChangerunnerindexCubit()),
            ],
            child: ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              child: BlocConsumer<ChangeAppCubit, ChangeAppState>(
                listener: (context, state) {
                  if (state is Changetheme) {
                    mode = state.isDarkMode;
                  } else if (state is Changelanguage) {
                    lang = 'en';
                  }
                },
                builder: (context, state) {
                  lang == null
                      ? BlocProvider.of<ChangeAppCubit>(context)
                          .getSavedLanguage()
                      : lang;

                  return BlocProvider<SignupCubit>(
                    create: (context) => SignupCubit(),
                    child: GetMaterialApp(
                      locale: lang == null ? Locale('en') : Locale(lang!),
                      initialRoute:
                          SharedPref().getString(PrefsKeys.accessToken) == null
                              ? AppRoutes.login
                              : isAdmin == true
                                  ? AppRoutes.admin
                                  : AppRoutes.customer,

                      // initialRoute: AppRoutes.test,
                      onGenerateRoute: AppRoutes.onGenerateRoute,
                      translations: MyLocal(),
                      theme: mode == false ? lightTheme() : darkTheme(),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            title: 'No NetWork ',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
            home: const NoInternetview(),
          );
        }
      },
    );
  }
}

/*

*/
