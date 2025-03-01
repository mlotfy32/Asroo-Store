import 'package:asroo_app/core/utiles/appInfo.dart';
import 'package:asroo_app/core/utiles/app_cubit/ChangeApp/changeApp_cubit.dart';
import 'package:asroo_app/core/utiles/constant.dart';
import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/service/push_Notification/firebaseCloudMessaging.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/customer/profile/presentation/view/widgets/customeRowProfile.dart';
import 'package:asroo_app/features/customer/profile/presentation/viewModel/getuserprofile/getuserprofile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profileviewbody extends StatefulWidget {
  const Profileviewbody({super.key});

  @override
  State<Profileviewbody> createState() => _ProfileviewbodyState();
}

class _ProfileviewbodyState extends State<Profileviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetuserprofileCubit>(context).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetuserprofileCubit, GetuserprofileState>(
      builder: (context, state) {
        final cubit = context.read<ChangeAppCubit>();
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              state is GetuserprofileLiading
                  ? LoadingShimmer(
                      width: 100.w,
                      height: 80.h,
                    )
                  : Container(
                      margin: EdgeInsets.only(top: 30.h),
                      width: 100.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${state is GetuserprofileSuccess ? state.userprofile.avatar : 'https://support.heberjahiz.com/hc/article_attachments/21013076295570'}'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadiusDirectional.circular(35)),
                    ),
              state is GetuserprofileLiading
                  ? LoadingShimmer(
                      width: 100.w,
                      height: 15.h,
                    )
                  : Text(
                      state is GetuserprofileSuccess
                          ? state.userprofile.name
                          : '',
                      style: AppFonts.f19w500
                          .copyWith(color: context.color.textColor),
                    ),
              state is GetuserprofileLiading
                  ? LoadingShimmer(
                      width: 100.w,
                      height: 15.h,
                    )
                  : Text(
                      state is GetuserprofileSuccess
                          ? state.userprofile.email
                          : '',
                      style: AppFonts.f19w500
                          .copyWith(color: Colors.grey, fontSize: 17),
                    ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    LangKeys.appFeatures.tr,
                    style: AppFonts.f19w500
                        .copyWith(color: context.color.textColor),
                  ),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    BlocProvider.of<ChangeAppCubit>(context)
                        .onTap(index: index, context: context);
                  },
                  child: CustomeRowProfile(
                    icon: Constans.preofileIcons[index],
                    title: Constans.preofileTitles[index],
                    child: index == 0
                        ? Row(
                            children: [
                              Text(
                                '${LangKeys.langCode.tr}',
                                style: AppFonts.f19w500,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          )
                        : index == 1
                            ? Switch.adaptive(
                                value: cubit.isDark,
                                activeColor: Colors.green,
                                inactiveTrackColor: Colors.grey,
                                onChanged: (value) async {
                                  BlocProvider.of<ChangeAppCubit>(context)
                                      .chageTheme();
                                },
                              )
                            : index == 2
                                ? Row(
                                    children: [
                                      Text(
                                        '${LangKeys.appName.tr}',
                                        style: AppFonts.f19w500,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  )
                                : index == 3
                                    ? ValueListenableBuilder(
                                        valueListenable:
                                            Firebasecloudmessaging()
                                                .isNotificationSubscribed,
                                        builder: (_, value, __) =>
                                            Switch.adaptive(
                                              value: value,
                                              activeColor: Colors.green,
                                              inactiveTrackColor: Colors.grey,
                                              onChanged: (value) async {
                                                await Firebasecloudmessaging()
                                                    .controllerForUserSubscription();
                                              },
                                            ))
                                    : index == 4
                                        ? FutureBuilder(
                                            future:
                                                Appinfo.getAppVersion(context),
                                            builder: (context, snapshot) =>
                                                snapshot.hasData
                                                    ? Text(
                                                        snapshot.data
                                                            .toString(),
                                                        style: AppFonts.f19w500,
                                                      )
                                                    : SizedBox.shrink(),
                                          )
                                        : Row(
                                            children: [
                                              Text(
                                                '${LangKeys.logOut.tr}',
                                                style: AppFonts.f19w500,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                  ),
                ),
                itemCount: 6,
              ))
            ],
          ),
        );
      },
    );
  }
}
