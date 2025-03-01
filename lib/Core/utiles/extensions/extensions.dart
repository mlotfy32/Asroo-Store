import 'package:asroo_app/core/utiles/theme/assets_extension.dart';
import 'package:asroo_app/core/utiles/theme/colorExtension.dart';
import 'package:flutter/material.dart';

extension contextEX on BuildContext {
  MyColor get color => Theme.of(this).extension<MyColor>()!;
  MyAssets get asset => Theme.of(this).extension<MyAssets>()!;
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  // String translate(String key) {
  //   return AppLocalizations.of(this)!.translate(key).toString();
  // }

  Future<dynamic> pushNamed({required String routName, Object? args}) {
    return Navigator.of(this).pushNamed(routName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(
      {required String routName, Object? args}) {
    return Navigator.of(this).pushReplacementNamed(routName, arguments: args);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      {required String routName, Object? args}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routName,
      (route) => false,
    );
  }

  void pop() => Navigator.of(this).pop();
}
