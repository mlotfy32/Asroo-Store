import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeProductText.dart';
import 'package:asroo_app/features/customer/category/presentation/viewModel/getcustomecategory/getcustomecategory_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Categoryviewbody extends StatefulWidget {
  const Categoryviewbody({super.key, required this.id, required this.title});
  final String id;
  final String title;
  @override
  State<Categoryviewbody> createState() => _CategoryviewbodyState();
}

class _CategoryviewbodyState extends State<Categoryviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetcustomecategoryCubit>(context)
        .getCategore(id: int.parse(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Dark.mainColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: AppFonts.style24Bold.copyWith(fontSize: 20.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 28,
            )),
      ),
      body: BlocBuilder<GetcustomecategoryCubit, GetcustomecategoryState>(
        builder: (context, state) {
          if (state is GetcustomecategorySuccess) {
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 150 / 250,
              ),
              itemBuilder: (context, index) {
                return CustomContainerLinearAdmin(
                  marginh: 7.w,
                  marginv: 3.h,
                  paddingh: 5,
                  paddingv: 2,
                  height: 347.h,
                  width: 160.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.shareNodes,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      CachedNetworkImage(
                          height: 139.h,
                          width: 200.w,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Helper.customeLoadingwidget(size: 70),
                          errorWidget: (context, url, error) => Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              ),
                          imageUrl: state.categories[index].images[0]),
                      Spacer(),
                      CustomeProductText(title: state.categories[index].title),
                      CustomeProductText(
                          title: state.categories[index].category.name),
                      CustomeProductText(
                          title: '\$ ${state.categories[index].price} '),
                    ],
                  ),
                );
              },
            );
          } else if (state is GetcustomecategoryFailure) {
            return Center(
              child: Text(
                state.error,
                style: AppFonts.style24Bold,
              ),
            );
          } else
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 150 / 250,
              ),
              itemBuilder: (context, index) {
                return LoadingShimmer();
              },
            );
        },
      ),
    );
  }
}
