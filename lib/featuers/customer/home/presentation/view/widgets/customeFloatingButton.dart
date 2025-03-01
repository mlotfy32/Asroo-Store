import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/changeselectedicon/changeselectedicon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asroo_app/core/utiles/durations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeFloatingButton extends StatelessWidget {
  const CustomeFloatingButton({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeselectediconCubit, ChangeselectediconState>(
        builder: (context, state) {
      final cubit = context.read<ChangeselectediconCubit>().iconState;
      if (cubit != 'homeTab') {
        return SizedBox.shrink();
      }
      return CustomFadeInLeft(
        duration: DurationFead.durationFeadIn,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h),
          child: FloatingActionButton(
            backgroundColor: context.color.bluePinkLight,
            onPressed: scrollAnimation,
            child: const Icon(
              Icons.arrow_upward_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      );
    });
  }

  void scrollAnimation() {
    controller.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.easeIn);
  }
}
