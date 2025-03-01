import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/admin/category/data/model/categoriesResponse.dart';
import 'package:asroo_app/features/customer/category/presentation/view/categoryView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class Categorieslist extends StatelessWidget {
  const Categorieslist(
      {super.key, required this.category, required this.isLoading});
  final List<Categoriesresponse> category;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 141,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: InkWell(
            onTap: () {
              Get.to(
                  curve: Curves.easeInCubic,
                  () => Categoryview(
                        id: category[index].id,
                        title: category[index].name,
                      ));
            },
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 25,
                            ),
                        progressIndicatorBuilder: (context, url, progress) =>
                            Helper.customeLoadingwidget(size: 20),
                        height: 90.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                        imageUrl: category[index].image)),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    category[index].name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.f19w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
