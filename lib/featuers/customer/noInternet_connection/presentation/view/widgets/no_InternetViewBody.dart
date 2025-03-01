import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:flutter/material.dart';

class NoInternetviewbody extends StatelessWidget {
  const NoInternetviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.noNetwork), fit: BoxFit.fill)),
    );
  }
}
