import 'dart:developer';

import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/deletecategory/deletecategory_cubit.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/createProduct.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeProductText.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/createproduct/createproduct_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/getallproducts/getallproducts_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/updateproduct/updateproduct_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductsItems extends StatelessWidget {
  const ProductsItems(
      {super.key,
      required this.title,
      required this.name,
      required this.price,
      required this.isLoading,
      required this.Url,
      required this.id,
      required this.description,
      required this.category,
      required this.categoryName});
  final String title;
  final String name;
  final int category;
  final String categoryName;
  final String description;

  final int price;
  final String Url;
  final String id;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      marginh: 7.w,
      marginv: 7.h,
      paddingh: 5,
      paddingv: 5,
      height: 300.h,
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<DeletecategoryCubit>(context)
                        .deleteCategory(id: id, delete: 'deleteProduct');
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    log('$category');
                    Get.bottomSheet(
                            MultiBlocProvider(
                              providers: [
                                BlocProvider<GetallproductsCubit>(
                                  create: (context) => GetallproductsCubit(),
                                ),
                                BlocProvider<CreateproductCubit>(
                                  create: (context) => CreateproductCubit(),
                                ),
                                BlocProvider<UpdateproductCubit>(
                                  create: (context) => UpdateproductCubit(),
                                ),
                                BlocProvider<UploadimageCubit>(
                                  create: (context) => UploadimageCubit(),
                                ),
                              ],
                              //TODO:name
                              child: Createproduct(
                                categoryName: categoryName,
                                category: category,
                                name: name,
                                description: description,
                                price: price,
                                title: title,
                                isUpdate: true,
                                id: id,
                                url: Url,
                              ),
                            ),
                            isScrollControlled: true,
                            isDismissible: true)
                        .whenComplete(() {
                      BlocProvider.of<GetallproductsCubit>(context)
                          .getAllProducts();
                    });
                  },
                  icon: Icon(
                    FontAwesomeIcons.edit,
                    color: Colors.teal,
                  ))
            ],
          ),
          isLoading == true
              ? LoadingShimmer(
                  width: 150.w,
                  height: 120.h,
                )
              : CachedNetworkImage(
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
                  imageUrl: Url),
          Spacer(),
          isLoading == true
              ? LoadingShimmer(
                  height: 20.h,
                  width: 120.w,
                )
              : CustomeProductText(title: title),
          isLoading == true
              ? LoadingShimmer(
                  height: 20.h,
                  width: 120.w,
                )
              : CustomeProductText(title: name),
          isLoading == true
              ? LoadingShimmer(
                  height: 20.h,
                  width: 120.w,
                )
              : CustomeProductText(title: '\$ $price '),
        ],
      ),
    );
  }
}
