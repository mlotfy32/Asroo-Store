import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/notification/data/hive/notificationModel.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/add_notification/add_notification_cubit.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/getallnotifications/getallnotifications_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/3.3%20custom_text_field.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Bottomsheetcontent extends StatefulWidget {
  Bottomsheetcontent(
      {super.key, required this.isEdited, required this.notificationModel});
  final bool isEdited;
  final NotificationModel notificationModel;

  @override
  State<Bottomsheetcontent> createState() => _BottomsheetcontentState();
}

class _BottomsheetcontentState extends State<Bottomsheetcontent> {
  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  TextEditingController prodictId = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    title.dispose();
    body.dispose();
    prodictId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNotificationCubit, AddNotificationState>(
      listener: (context, state) {
        if (state is AddNotificationSuccess) {
          context.pop();
          BlocProvider.of<GetallnotificationsCubit>(context)
              .getAllNotifications();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        width: Get.size.width,
        height: Get.size.height - 284.h,
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Enter the Notification Title',
                  style: AppFonts.f19w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  validator: (text) {
                    if (text!.isEmpty || text == '') {
                      return 'Notification title is required';
                    }
                  },
                  controller: title,
                  hintText: widget.isEdited
                      ? widget.notificationModel.title
                      : 'Notification title',
                  hintStyle: AppFonts.hintStyle,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Enter the Notification body',
                  style: AppFonts.f19w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  validator: (text) {
                    if (text!.isEmpty || text == '') {
                      return 'Notification body is required';
                    }
                  },
                  controller: body,
                  hintText: widget.isEdited
                      ? widget.notificationModel.body
                      : 'Notification body',
                  hintStyle: AppFonts.hintStyle,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Enter the Product id',
                  style: AppFonts.f19w500,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomTextField(
                  validator: (text) {
                    if (text!.isEmpty || text == '') {
                      return 'Notification id is required';
                    }
                  },
                  controller: prodictId,
                  keyboardType: TextInputType.number,
                  hintText: widget.isEdited
                      ? '${widget.notificationModel.id}'
                      : 'Product id',
                  hintStyle: AppFonts.hintStyle,
                ),
                Spacer(),
                Customelinearbutton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (widget.isEdited) {
                          widget.notificationModel.delete();
                        }
                        BlocProvider.of<AddNotificationCubit>(context)
                            .addNotification(
                                isEdite: widget.isEdited,
                                notificationModel: NotificationModel(
                                    id: int.parse(prodictId.text),
                                    body: body.text,
                                    title: title.text,
                                    createdDate: DateTime.now()));
                      }
                    },
                    child:
                        BlocBuilder<AddNotificationCubit, AddNotificationState>(
                      builder: (context, state) {
                        if (state is AddNotificationLoading) {
                          return CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return Text(
                          widget.isEdited
                              ? 'Edit Notification'
                              : 'Add Notification',
                          style: AppFonts.f19w500,
                        );
                      },
                    ),
                    width: Get.size.width,
                    height: 50.h,
                    colors: [Dark.black2, Dark.navBarDark])
              ],
            )),
        decoration: BoxDecoration(
            color: Dark.blueDark,
            borderRadius:
                BorderRadiusDirectional.only(topStart: Radius.circular(15))),
      ),
    );
  }
}
