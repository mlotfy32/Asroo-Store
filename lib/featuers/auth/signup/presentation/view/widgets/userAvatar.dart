import 'package:asroo_app/core/utiles/image_Picker.dart';
import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:asroo_app/features/auth/signup/presentation/viewModel/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:flutter/material.dart';
import 'package:asroo_app/core/utiles/durations.dart';

class Useravatar extends StatelessWidget {
  const Useravatar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration: DurationFead.durationFeadIn,
      child: GestureDetector(onTap: () async {
        await ImagePick().pickImage(context: context);
      }, child: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return state is ImageLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Container(
                  alignment: Alignment.topLeft,
                  child: state is ImageSuccess
                      ? SizedBox()
                      : Icon(
                          Icons.camera_alt_outlined,
                          size: 27,
                          color: Colors.white,
                        ),
                  width: 60.w,
                  height: 75.h,
                  margin: EdgeInsets.symmetric(horizontal: 110),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: state is ImageSuccess
                            ? NetworkImage(state.imageUrl)
                            : AssetImage(AppImages.person),
                      )));
        },
      )),
    );
  }
}
/*

*/
