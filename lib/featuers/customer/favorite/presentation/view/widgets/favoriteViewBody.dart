import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/language/lang_keys.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
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
import 'package:get/route_manager.dart';

class Favoriteviewbody extends StatefulWidget {
  const Favoriteviewbody({super.key, required this.productId});
  final int productId;
  @override
  State<Favoriteviewbody> createState() => _FavoriteviewbodyState();
}

class _FavoriteviewbodyState extends State<Favoriteviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetFavoriteCubit>(context).getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          height: 30.h,
        ),
      ),
      SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Favorites',
              style: AppFonts.style24Bold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: BlocBuilder<GetFavoriteCubit, GetFavoriteState>(
          builder: (context, state) {
            if (state is GetFavoriteFailure) {
              return Center(
                  child: Text(
                'No Data Available',
                style: AppFonts.style24Bold.copyWith(color: Colors.white),
              ));
            } else if (state is GetFavoriteSuccess) {
              return Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: state.data.isNotEmpty
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: state.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 150 / 250,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    () => BlocProvider<ChangerunnerindexCubit>(
                                          create: (context) =>
                                              ChangerunnerindexCubit(),
                                          child: Productdetailes(
                                            productId: widget.productId,
                                            isFavorite: true,
                                          ),
                                        ));
                              },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () async {},
                                            icon: Icon(
                                              FontAwesomeIcons.shareNodes,
                                              color: Colors.white,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              state.data[index].delete();
                                              BlocProvider.of<GetFavoriteCubit>(
                                                      context)
                                                  .getFavorite();
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Dark.blueDark,
                                            ))
                                      ],
                                    ),
                                    CachedNetworkImage(
                                        height: 139.h,
                                        width: 200.w,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Helper.customeLoadingwidget(
                                                size: 70),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                              child: Icon(
                                                Icons.error,
                                                color: Colors.red,
                                                size: 50,
                                              ),
                                            ),
                                        imageUrl: state.data[index].image),
                                    Spacer(),
                                    CustomeProductText(
                                        title: state.data[index].title),
                                    CustomeProductText(
                                        title: state.data[index].name),
                                    CustomeProductText(
                                        title:
                                            '\$ ${state.data[index].price} '),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                          'No Data Available',
                          style: AppFonts.style24Bold
                              .copyWith(color: Colors.white),
                        )));
            } else {
              return Center(child: Helper.customeLoadingwidget(size: 100));
            }
          },
        ),
      ),
    ]);
  }
}
