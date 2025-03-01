import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/admin/category/presentation/view/widgets/createCategory.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/createcategory/createcategory_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/deletecategory/deletecategory_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/updatecategory/updatecategory_cubit.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategorieItem extends StatelessWidget {
  const CategorieItem({
    super.key,
    required this.image,
    required this.title,
    required this.isLoading,
    required this.id,
  });
  final String image;
  final String title;
  final String id;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeletecategoryCubit, DeletecategoryState>(
      listener: (context, state) {
        if (state is DeletecategoryLoading) {
          Helper.customeLoadingSnac(title: 'Deleting category');
        } else if (state is DeletecategorySuccess) {
          Helper.FlutterToast(title: 'Category Deleted', success: true);
          BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
        } else if (state is DeletecategoryFailure) {
          Helper.FlutterToast(title: state.errorMessage, success: false);
        }
      },
      child: CustomContainerLinearAdmin(
          marginh: 10,
          marginv: 5,
          paddingh: 10,
          paddingv: 10,
          height: 130.h,
          width: Get.size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: isLoading == true
                        ? LoadingShimmer(
                            width: 150.w,
                            height: 30,
                          )
                        : Text(
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            title,
                            style: AppFonts.style24Bold,
                          ),
                  ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<DeletecategoryCubit>(context)
                                  .deleteCategory(
                                      id: id, delete: 'deleteCategory');
                            },
                            icon: Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.red,
                            )),
                        IconButton(
                            onPressed: () {
                              Get.bottomSheet(
                                  MultiBlocProvider(
                                      providers: [
                                        BlocProvider<CreatecategoryCubit>(
                                          create: (context) =>
                                              CreatecategoryCubit(),
                                        ),
                                        BlocProvider<GetallcategoriesCubit>(
                                          create: (context) =>
                                              GetallcategoriesCubit(),
                                        ),
                                        BlocProvider<UploadimageCubit>(
                                          create: (context) =>
                                              UploadimageCubit(),
                                        ),
                                        BlocProvider<UpdatecategoryCubit>(
                                          create: (context) =>
                                              UpdatecategoryCubit(),
                                        ),
                                      ],
                                      child: CreateCategory(
                                        isUpdate: true,
                                        name: title,
                                        url: image,
                                        id: id,
                                      )),
                                  isScrollControlled: true,
                                  isDismissible: true);
                            },
                            icon: Icon(
                              FontAwesomeIcons.edit,
                              color: Colors.teal,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              isLoading == true
                  ? LoadingShimmer(
                      width: 100.w,
                      height: 100.h,
                    )
                  : CachedNetworkImage(
                      imageUrl: image,
                      width: 120.w,
                      height: 90.h,
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
            ],
          )),
    );
  }
}
