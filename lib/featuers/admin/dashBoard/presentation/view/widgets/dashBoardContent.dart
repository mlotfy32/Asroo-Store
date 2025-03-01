import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardContent extends StatelessWidget {
  const DashBoardContent({
    super.key,
    required this.count,
    required this.title,
    required this.image,
    required this.isLoading,
  });
  final String count;
  final String title;
  final String image;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
        marginh: 10,
        marginv: 10,
        paddingh: 5,
        paddingv: 5,
        height: 130,
        width: Get.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.style24Bold,
                ),
                Spacer(),
                isLoading == true
                    ? LoadingShimmer(
                        height: 30.h,
                        width: 100.w,
                      )
                    : Text(count,
                        textAlign: TextAlign.start,
                        style: count == '!'
                            ? AppFonts.style24Bold.copyWith(color: Colors.red)
                            : AppFonts.style24Bold)
              ],
            ),
            Image.asset(
              image,
              width: 120.w,
              height: 80.h,
            ),
          ],
        ));
  }
}
