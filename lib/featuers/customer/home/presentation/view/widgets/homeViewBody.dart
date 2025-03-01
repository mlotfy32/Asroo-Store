import 'dart:developer';

import 'package:asroo_app/core/utiles/app_cubit/dynamiclink/dynamiclink_cubit.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/loading/1.2%20loading_shimmer.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/customeContainerLinearAdmin.dart';
import 'package:asroo_app/features/admin/product/data/models/getAllProductsRes.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeProductText.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/getallproducts/getallproducts_cubit.dart';
import 'package:asroo_app/features/customer/favorite/data/favorite_Model.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/bunnerSlider.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/categoriesList.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/productDetailes.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/changerunnerindex/changerunnerindex_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/getone/getone_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/getFavorite/get_favorite_cubit.dart';

class Homeviewbody extends StatefulWidget {
  const Homeviewbody({super.key, required this.controller});
  final ScrollController controller;
  @override
  State<Homeviewbody> createState() => _HomeviewbodyState();
}

class _HomeviewbodyState extends State<Homeviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
    BlocProvider.of<GetallproductsCubit>(context).getAllProducts();
    BlocProvider.of<GetFavoriteCubit>(context).getFavoriteKeys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Getallproductsres> products = [];
    List<dynamic> favorite = [];

    return BlocListener<GetFavoriteCubit, GetFavoriteState>(
      listener: (context, state) {
        if (state is GetFavoriteSuccess) {
          favorite.clear();
          favorite = state.data;
          log('GetFavoriteSuccess ${favorite}');
        }
      },
      child: BlocListener<AddtofavoriteCubit, AddtofavoriteState>(
        listener: (context, state) {
          if (state is AddtofavoriteSuccess) {
            favorite.clear();
            favorite = state.data;
            log('AddtofavoriteSuccess ${favorite}');
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
            BlocProvider.of<GetallproductsCubit>(context).getAllProducts();
            BlocProvider.of<GetFavoriteCubit>(context).getFavoriteKeys();
          },
          child: CustomScrollView(
            controller: widget.controller,
            slivers: [
              SliverToBoxAdapter(
                  child: BlocProvider<ChangerunnerindexCubit>(
                create: (context) => ChangerunnerindexCubit(),
                child: Bunnerslider(
                  Url: AppImages.bunners,
                ),
              )),
              SliverToBoxAdapter(child:
                  BlocBuilder<GetallcategoriesCubit, GetallcategoriesState>(
                      builder: (context, state) {
                if (state is GetallcategoriesSuccess) {
                  return Categorieslist(
                    category: state.categories,
                    isLoading: false,
                  );
                } else if (state is GetallcategoriesFailure) {
                  return Center(
                    child: Text(
                      'No Categories Found',
                      style: AppFonts.f19w500,
                    ),
                  );
                } else if (state is GetallcategoriesFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppFonts.f19w500,
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => LoadingShimmer(
                        height: 80.h,
                        borderRadius: 15,
                        width: 100.w,
                      ),
                      itemCount: 8,
                    ),
                  );
                }
              })),
              SliverToBoxAdapter(
                child: BlocBuilder<GetallproductsCubit, GetallproductsState>(
                  builder: (context, state) {
                    log('GetallproductsSuccess rebuild state');

                    if (state is GetallproductsSuccess) {
                      products.addAll(state.products);
                      return GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 150 / 250,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => BlocProvider<ChangerunnerindexCubit>(
                                    create: (context) =>
                                        ChangerunnerindexCubit(),
                                    child: BlocProvider<GetoneCubit>(
                                      create: (context) => GetoneCubit(),
                                      child: Productdetailes(
                                        productId:
                                            int.parse(state.products[index].id),
                                        isFavorite: favorite
                                            .contains(products[index].id),
                                      ),
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
                                          onPressed: () async {
                                            BlocProvider.of<DynamiclinkCubit>(
                                                    context)
                                                .sendDynamicLink(
                                                    context: context,
                                                    productId: int.parse(state
                                                        .products[index].id),
                                                    title: state
                                                        .products[index].title,
                                                    imageUrl: state
                                                        .products[index].images,
                                                    price: state
                                                        .products[index].price,
                                                    description: state
                                                        .products[index]
                                                        .description,
                                                    isFavorite:
                                                        favorite.contains(state
                                                                .products[index]
                                                                .id)
                                                            ? true
                                                            : false);
                                          },
                                          icon: Icon(
                                            FontAwesomeIcons.shareNodes,
                                            color: Colors.white,
                                          )),
                                      BlocBuilder<AddtofavoriteCubit,
                                              AddtofavoriteState>(
                                          builder: (context, state) {
                                        log('Addtofavorite rebuild state');
                                        state is AddtofavoriteSuccess
                                            ? favorite = state.data
                                            : favorite;
                                        return IconButton(
                                            onPressed: () {
                                              BlocProvider.of<
                                                          AddtofavoriteCubit>(
                                                      context)
                                                  .addToFavorite(
                                                      oldData: favorite,
                                                      favorite: FavoriteModel(
                                                          id: products[index]
                                                              .id,
                                                          image: products[index]
                                                              .images[0],
                                                          name: products[index]
                                                              .categories
                                                              .name,
                                                          price:
                                                              '${products[index].price}',
                                                          title: products[index]
                                                              .title));
                                            },
                                            icon: favorite.contains(
                                                    products[index].id)
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: Dark.blueDark,
                                                  )
                                                : Icon(
                                                    FontAwesomeIcons.heart,
                                                    color: Colors.white,
                                                  ));
                                      })
                                    ],
                                  ),
                                  CachedNetworkImage(
                                      height: 139.h,
                                      width: 200.w,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Helper.customeLoadingwidget(size: 70),
                                      errorWidget: (context, url, error) =>
                                          Center(
                                            child: Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 50,
                                            ),
                                          ),
                                      imageUrl:
                                          state.products[index].images[0]),
                                  Spacer(),
                                  CustomeProductText(
                                      title: state.products[index].title),
                                  CustomeProductText(
                                      title: state
                                          .products[index].categories.name),
                                  CustomeProductText(
                                      title:
                                          '\$ ${state.products[index].price} '),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is GetallproductsFailure) {
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 150 / 250,
                        ),
                        itemBuilder: (context, index) {
                          return LoadingShimmer();
                        },
                      );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 60.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
