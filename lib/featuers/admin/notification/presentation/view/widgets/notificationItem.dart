import 'dart:developer';

import 'package:asroo_app/core/utiles/extensions/date_Extention.dart';
import 'package:asroo_app/core/utiles/service/dio/dio_factory.dart';
import 'package:asroo_app/core/utiles/service/push_Notification/notificationHelper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/notification/data/hive/notificationModel.dart';
import 'package:asroo_app/features/admin/notification/presentation/view/widgets/bottomSheetContent.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/add_notification/add_notification_cubit.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/getallnotifications/getallnotifications_cubit.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/sendnotification/sendnotification_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notificationModel});
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      width: Get.size.width,
      height: 173.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Dark.mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Title : ',
                  style: AppFonts.f19w500,
                ),
                TextSpan(
                  text: notificationModel.title,
                  style: AppFonts.f19w500.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Body : ',
                  style: AppFonts.f19w500,
                ),
                TextSpan(
                  text: notificationModel.body,
                  style: AppFonts.f19w500.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Created at : ',
                  style: AppFonts.f19w500,
                ),
                TextSpan(
                  text: '${notificationModel.createdDate.getFormate()}',
                  style: AppFonts.f19w500.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    notificationModel.delete();
                    BlocProvider.of<GetallnotificationsCubit>(context)
                        .getAllNotifications();
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  )),
              SizedBox(
                width: 10.w,
              ),
              IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                        isScrollControlled: true,
                        isDismissible: true,
                        MultiBlocProvider(
                          providers: [
                            BlocProvider<GetallnotificationsCubit>(
                                create: (context) =>
                                    GetallnotificationsCubit()),
                            BlocProvider.value(value: AddNotificationCubit())
                          ],
                          child: Bottomsheetcontent(
                            isEdited: true,
                            notificationModel: notificationModel,
                          ),
                        ));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.teal,
                  )),
              SizedBox(
                width: 10.w,
              ),
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<SendnotificationCubit>(context)
                        .sendNotification(
                            title: notificationModel.title,
                            body: notificationModel.body,
                            productId: notificationModel.id);
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.green,
                  )),
              SizedBox(
                width: 10.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
