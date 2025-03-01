import 'dart:developer';

import 'package:asroo_app/core/utiles/app_cubit/closebottomsheet/closebottomsheet_cubit.dart';
import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeImagesList.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeProductForm.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/createproduct/createproduct_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/getallproducts/getallproducts_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/updateproduct/updateproduct_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Createproduct extends StatefulWidget {
  const Createproduct(
      {super.key,
      required this.isUpdate,
      required this.name,
      required this.url,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.categoryName});
  final bool isUpdate;
  final String name;
  final String title;
  final int price;
  final String categoryName;
  final String description;
  final int category;
  final String url;
  final String id;
  @override
  State<Createproduct> createState() => _CreateproductState();
}

class _CreateproductState extends State<Createproduct> {
  TextEditingController titlecotroller = TextEditingController();
  TextEditingController pricecotroller = TextEditingController();
  TextEditingController descriptioncotroller = TextEditingController();
  TextEditingController categorycotroller = TextEditingController();

  @override
  void dispose() {
    titlecotroller.dispose();
    pricecotroller.dispose();
    descriptioncotroller.dispose();

    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateproductCubit, CreateproductState>(
      listener: (context, state) {
        if (state is CreateproductLoading) {
          Helper.customeLoadingSnac(title: 'Creating New Product');
        } else if (state is CreateproductSuccess) {
          Helper.FlutterToast(
              title: 'Product created successfully', success: true);
          context.pop();
          BlocProvider.of<GetallproductsCubit>(context).getAllProducts();
        } else if (state is CreateproductFailure) {
          Helper.FlutterToast(title: state.errorMessage, success: false);
        } else if (state is UploadProductImageSuccess) {
          imagePath = state.imageUrl;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        width: Get.size.width,
        height: Get.size.height * 0.9,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(15)),
          color: Dark.blueDark,
        ),
        child: BlocListener<UpdateproductCubit, UpdateproductState>(
          listener: (context, state) {
            if (state is UpdateproductLoading) {
              Helper.customeLoadingSnac(title: 'Updating Product');
            } else if (state is UpdateproductSuccess) {
              Helper.FlutterToast(
                  title: 'Product updated successfully', success: true);
              context.pop();
            } else if (state is UpdateproductFailure) {
              Helper.FlutterToast(title: state.errorMessage, success: false);
              log(state.errorMessage);
            }
          },
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  widget.isUpdate == true ? 'Update Product' : 'Create Product',
                  style: AppFonts.style24Bold
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add a photo',
                  style: AppFonts.f19w500,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              MultiBlocProvider(
                  providers: [
                    BlocProvider<UploadimageCubit>(
                        create: (context) => UploadimageCubit()),
                  ],
                  child: CustomeImagesList(
                      isUpdate: widget.isUpdate, url: widget.url)),
              SizedBox(
                height: 10.h,
              ),
              Customeproductform(
                  categoryName: widget.categoryName,
                  category: widget.category,
                  categoryController: categorycotroller,
                  descriptionController: descriptioncotroller,
                  priceController: pricecotroller,
                  titleController: titlecotroller,
                  title: widget.title,
                  formKey: formKey,
                  price: widget.price,
                  description: widget.description,
                  isUpdate: widget.isUpdate),
              SizedBox(
                height: 20.h,
              ),
              Customelinearbutton(
                  colors: [Colors.white, Colors.white],
                  onTap: () {
                    log('${widget.category}');
                    if (widget.isUpdate == true) {
                      BlocProvider.of<UpdateproductCubit>(context)
                          .updateProduct(
                              id: widget.id,
                              title: titlecotroller.text.isEmpty
                                  ? widget.title
                                  : titlecotroller.text,
                              price: pricecotroller.text.isEmpty
                                  ? widget.price
                                  : int.parse(pricecotroller.text),
                              description: descriptioncotroller.text.isEmpty
                                  ? widget.description
                                  : descriptioncotroller.text,
                              imageUrl:
                                  imagePath == '' ? widget.url : imagePath);
                    } else if (formKey.currentState!.validate() &&
                        widget.isUpdate == false) {
                      if (imagePath.isNotEmpty) {
                        BlocProvider.of<CreateproductCubit>(context)
                            .createProduct(
                                categoryId: categorycotroller.text,
                                title: titlecotroller.text,
                                price: int.parse(pricecotroller.text),
                                description: descriptioncotroller.text,
                                image: imagePath);
                      } else {
                        Helper.FlutterToast(
                            title: 'Please add product photo', success: false);
                      }
                    } else if (imagePath.isEmpty) {
                      Helper.FlutterToast(
                          title: 'Please add product photo', success: false);
                    }
                  },
                  child: Text(
                    widget.isUpdate == true
                        ? 'Update product'
                        : 'Create a new product',
                    style: AppFonts.f19w500.copyWith(
                      color: Dark.blueDark,
                      fontSize: 18,
                    ),
                  ),
                  width: Get.size.width,
                  height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
