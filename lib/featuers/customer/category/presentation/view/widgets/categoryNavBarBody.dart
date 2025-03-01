import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeProductText.dart';
import 'package:asroo_app/features/customer/category/presentation/viewModel/getcustomecategory/getcustomecategory_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:asroo_app/features/customer/category/presentation/view/widgets/categoryViewBody.dart';

class Categorynavbarbody extends StatefulWidget {
  const Categorynavbarbody({super.key});

  @override
  State<Categorynavbarbody> createState() => _CategorynavbarbodyState();
}

class _CategorynavbarbodyState extends State<Categorynavbarbody> {
  @override
  void initState() {
    BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetallcategoriesCubit, GetallcategoriesState>(
        builder: (context, state) {
          if (state is GetallcategoriesSuccess) {
            return SizedBox(
              height: Get.size.height - 55.h,
              child: GridView.builder(
                itemCount: state.categories.length,
                padding: EdgeInsets.only(top: 30.h),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 150 / 180,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                          curve: Curves.easeInCubic,
                          () => BlocProvider<GetcustomecategoryCubit>(
                                create: (context) => GetcustomecategoryCubit(),
                                child: Categoryviewbody(
                                  id: state.categories[index].id,
                                  title: state.categories[index].name,
                                ),
                              ));
                    },
                    child: CustomContainerLinearAdmin(
                      marginh: 7.w,
                      marginv: 3.h,
                      paddingh: 5,
                      paddingv: 2,
                      height: 200.h,
                      width: 160.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                                height: 130.h,
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
                                imageUrl: state.categories[index].image),
                          ),
                          Spacer(),
                          CustomeProductText(
                              title: state.categories[index].name),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is GetallcategoriesFailure) {
            return Center(
              child: Text(
                state.errorMessage,
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
