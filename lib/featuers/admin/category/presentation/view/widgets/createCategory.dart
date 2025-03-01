import 'dart:developer';

import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/createcategory/createcategory_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/updatecategory/updatecategory_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/3.3%20custom_text_field.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({
    super.key,
    required this.isUpdate,
    this.name,
    this.url,
    this.id,
  });
  final bool isUpdate;
  final name;
  final url;
  final id;

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  String imagePath = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadimageCubit, UploadimageState>(
      listener: (context, state) {
        if (state is UploadimageSuccess) {
          imagePath = state.imagePath;
        }
      },
      child: BlocListener<CreatecategoryCubit, CreatecategoryState>(
        listener: (context, state) {
          if (state is CreatecategoryLoading) {
            Helper.customeLoadingSnac(title: 'adding new category');
          } else if (state is CreatecategorySuccess) {
            Helper.FlutterToast(title: 'Category Created', success: true);
            context.pop();
            BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
          } else if (state is CreatecategoryFailure) {
            Helper.FlutterToast(title: state.errorMessage, success: false);
            BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
          }
        },
        child: BlocListener<UpdatecategoryCubit, UpdatecategoryState>(
          listener: (context, state) {
            if (state is UpdatecategorySuccess) {
              Helper.FlutterToast(title: 'Category Updated', success: true);
              context.pop();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: Get.size.width,
            decoration: BoxDecoration(
                color: Dark.blueDark,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            height: Get.size.height * 3 / 5,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Create Category',
                    style: AppFonts.style24Bold
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Add a photo',
                    style: AppFonts.f19w500,
                    textAlign: TextAlign.left,
                  ),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<UploadimageCubit>(context)
                        .pickImage(context: context);
                  },
                  child: BlocBuilder<UploadimageCubit, UploadimageState>(
                    builder: (context, state) {
                      if (state is UploadimageSuccess) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          width: Get.size.width,
                          height: 120.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(state.imagePath),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[500]),
                        );
                      }
                      if (state is UploadimageLoading) {
                        return Container(
                          child: Center(child: CircularProgressIndicator()),
                          margin: EdgeInsets.all(10),
                          width: Get.size.width,
                          height: 120.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[500]),
                        );
                      }
                      return widget.isUpdate == true
                          ? Container(
                              margin: EdgeInsets.all(10),
                              width: Get.size.width,
                              height: 120.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(widget.url),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[500]),
                            )
                          : Container(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 50,
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(10),
                              width: Get.size.width,
                              height: 120.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[500]),
                            );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter the Category Name',
                    style: AppFonts.f19w500,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Form(
                  key: formKey,
                  child: CustomTextField(
                    validator: (text) {
                      if (text!.isEmpty || text == '') {
                        return 'Category Name is required';
                      }
                    },
                    controller: controller,
                    hintText:
                        widget.isUpdate == true ? widget.name : 'category name',
                    hintStyle: AppFonts.hintStyle,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Customelinearbutton(
                    colors: [Colors.white, Colors.white],
                    onTap: () {
                      if (widget.isUpdate == true) {
                        BlocProvider.of<UpdatecategoryCubit>(context)
                            .updateCategory(
                                id: widget.id,
                                name: controller.text == ''
                                    ? widget.name
                                    : controller.text,
                                imageUrl:
                                    imagePath == '' ? widget.url : imagePath);
                        BlocProvider.of<GetallcategoriesCubit>(context)
                            .getAllCategories();
                      } else {
                        if (imagePath.isNotEmpty) {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<CreatecategoryCubit>(context)
                                .createCategory(
                                    name: controller.text, url: imagePath);
                            BlocProvider.of<GetallcategoriesCubit>(context)
                                .getAllCategories();
                          }
                        } else {
                          Helper.FlutterToast(
                              title: 'Please add category photo',
                              success: false);
                        }
                      }
                    },
                    child: Text(
                      widget.isUpdate == true
                          ? 'Update category'
                          : 'Create a new category',
                      style: AppFonts.f19w500.copyWith(
                        color: Dark.blueDark,
                        fontSize: 18,
                      ),
                    ),
                    width: Get.size.width,
                    height: 40.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
