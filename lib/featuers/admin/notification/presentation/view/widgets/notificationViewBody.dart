import 'dart:developer';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/service/push_Notification/localNotification.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/notification/data/hive/notificationModel.dart';
import 'package:asroo_app/features/admin/notification/presentation/view/widgets/bottomSheetContent.dart';
import 'package:asroo_app/features/admin/notification/presentation/view/widgets/notificationItem.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/add_notification/add_notification_cubit.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/getallnotifications/getallnotifications_cubit.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/sendnotification/sendnotification_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Notificationviewbody extends StatefulWidget {
  const Notificationviewbody({super.key});

  @override
  State<Notificationviewbody> createState() => _NotificationviewbodyState();
}

class _NotificationviewbodyState extends State<Notificationviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetallnotificationsCubit>(context).getAllNotifications();
    notificationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetallnotificationsCubit, GetallnotificationsState>(
      listener: (context, state) {
        if (state is GetallnotificationsSuccess) {
          log('Getallnotifications');
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Notification',
                  style: AppFonts.f19w500,
                ),
                Customelinearbutton(
                    onTap: () {
                      Get.bottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) =>
                                      GetallnotificationsCubit(),
                                ),
                                BlocProvider.value(
                                    value: AddNotificationCubit())
                              ],
                              child: Bottomsheetcontent(
                                notificationModel: NotificationModel(
                                    id: 0,
                                    body: '',
                                    title: '',
                                    createdDate: DateTime.now()),
                                isEdited: false,
                              )));
                    },
                    child: Text(
                      'Add',
                      style: AppFonts.f19w500,
                    ),
                    width: 100,
                    height: 40,
                    colors: [Dark.blueDark, Dark.navBarDark]),
              ],
            ),
            SizedBox(
                width: Get.size.width,
                height: Get.size.height - 123.h,
                child: BlocBuilder<GetallnotificationsCubit,
                    GetallnotificationsState>(
                  builder: (context, state) {
                    if (state is GetallnotificationsLoading) {
                      return ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) => LoadingShimmer(
                                width: Get.size.width,
                                height: 173.h,
                              ));
                    } else if (state is GetallnotificationsSuccess) {
                      log('rebuild Getallnotifications success');
                      return RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<GetallnotificationsCubit>(context)
                              .getAllNotifications();
                        },
                        child: ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (context, index) =>
                              BlocProvider<SendnotificationCubit>(
                            create: (context) => SendnotificationCubit(),
                            child: NotificationItem(
                              notificationModel: state.data[index],
                            ),
                          ),
                        ),
                      );
                    } else if (state is GetallnotificationsFailure) {
                      return Center(
                          child: Text(
                        state.error,
                        style: AppFonts.style24Bold,
                        textAlign: TextAlign.center,
                      ));
                    }
                    return Center(
                        child: Text(
                      'No Notifications',
                      style: AppFonts.f19w500,
                      textAlign: TextAlign.center,
                    ));
                  },
                )),
          ],
        ),
      ),
    );
  }

  notificationPermission() async {
    await LocalNotificationService.init();
  }
}
