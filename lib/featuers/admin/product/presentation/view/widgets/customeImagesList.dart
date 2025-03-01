import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/createproduct/createproduct_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomeImagesList extends StatelessWidget {
  const CustomeImagesList(
      {super.key, required this.isUpdate, required this.url});
  final bool isUpdate;
  final url;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CreateproductCubit>(context)
            .pickImage(context: context);
      },
      child: BlocBuilder<CreateproductCubit, CreateproductState>(
        builder: (context, state) {
          if (state is UploadimageLoading) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
              margin: EdgeInsets.all(5),
              width: Get.size.width,
              height: 120.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[500]),
            );
          } else if (state is UploadProductImageSuccess) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: Get.size.width,
              height: 120.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(state.imageUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[500]),
            );
          }
          return isUpdate == true
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.size.width,
                  height: 120.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(url), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[500]),
                )
              : Container(
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  width: Get.size.width,
                  height: 120.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[500]),
                );
        },
      ),
    );
  }
}
