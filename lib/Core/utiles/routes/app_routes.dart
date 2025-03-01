import 'package:asroo_app/core/utiles/routes/base_routes.dart';
import 'package:asroo_app/features/admin/presentation/view/adminView.dart';
import 'package:asroo_app/features/admin/product/presentation/view/productView.dart';
import 'package:asroo_app/features/auth/login/presentation/view/loginview.dart';
import 'package:asroo_app/features/auth/signup/presentation/view/signUpView.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/productDetailes.dart';
import 'package:asroo_app/features/customer/main/presentation/view/mainScreenView.dart';
import 'package:asroo_app/features/customer/noInternet_connection/presentation/view/no_InternetView.dart';
// import 'package:asroo_app/features/home/view/homeview.dart';
import 'package:asroo_app/test.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signup = 'signup';
  static const String test = 'signtestup';
  static const String noNetwork = 'noNetwork';
  static const String admin = 'admin';
  static const String initial = 'initial';
  static const String customer = 'customer';
  static const String productDetailes = 'customer';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: Loginview());
      case signup:
        return BaseRoute(page: Signupview());
      case test:
        return BaseRoute(page: Test());
      case noNetwork:
        return BaseRoute(page: NoInternetview());
      case admin:
        return BaseRoute(page: Adminview());
      case initial:
        return BaseRoute(page: Productview());
      case customer:
        return BaseRoute(page: Mainscreenview());
      case productDetailes:
      default:
        return BaseRoute(page: NoInternetview());
    }
  }
}
