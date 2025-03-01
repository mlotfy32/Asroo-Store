import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeProductText.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/getFavorite/get_favorite_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/productDetailes.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/changerunnerindex/changerunnerindex_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchSuccess extends StatelessWidget {
  const SearchSuccess({super.key, required this.data});
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    List<dynamic> Favorite = [];
    return BlocListener<GetFavoriteCubit, GetFavoriteState>(
      listener: (context, state) {
        if (state is GetFavoriteSuccess) {
          Favorite = state.data;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Dark.mainColor,
          centerTitle: true,
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
        body: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 150 / 250,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(
                  curve: Curves.easeInCirc,
                  duration: Duration(milliseconds: 700),
                  () => BlocProvider<ChangerunnerindexCubit>(
                        create: (context) => ChangerunnerindexCubit(),
                        child: Productdetailes(
                          productId: 0,
                          isFavorite: Favorite.contains(data[index].id),
                        ),
                      )),
              child: CustomContainerLinearAdmin(
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
                        imageUrl: data[index].images[0]),
                    Spacer(),
                    CustomeProductText(title: data[index].title),
                    CustomeProductText(title: data[index].description),
                    CustomeProductText(title: '\$ ${data[index].price} '),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
