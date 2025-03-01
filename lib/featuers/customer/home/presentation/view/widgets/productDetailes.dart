import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/changerunnerindex/changerunnerindex_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/getone/getone_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Productdetailes extends StatefulWidget {
  const Productdetailes(
      {super.key, required this.productId, required this.isFavorite});
  final int productId;

  final bool isFavorite;

  @override
  State<Productdetailes> createState() => _ProductdetailesState();
}

class _ProductdetailesState extends State<Productdetailes> {
  @override
  void initState() {
    BlocProvider.of<GetoneCubit>(context)
        .getOne(id: widget.productId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> images = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.color.mainColor,
          title: BlocBuilder<GetoneCubit, GetoneState>(
            builder: (context, state) {
              if (state is GetoneLoading) {
                return CircularProgressIndicator();
              } else if (state is GetoneSuccess) {
                return Text(
                  state.data.title,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.f19w500,
                );
              }
              return Text(
                'Not Found',
                overflow: TextOverflow.ellipsis,
                style: AppFonts.f19w500,
              );
            },
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: Get.back,
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 30,
              )),
        ),
        body: BlocBuilder<GetoneCubit, GetoneState>(
          builder: (context, state) {
            if (state is GetoneLoading) {
              return Helper.customeLoadingwidget(size: 70);
            } else if (state is GetoneSuccess) {
              images = state.data.images;
              return Container(
                width: Get.size.width,
                height: Get.size.height,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(context.asset.homeBg!),
                        fit: BoxFit.fill)),
                child: ListView(
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
                            icon: widget.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Dark.blueDark,
                                  )
                                : Icon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.white,
                                  ))
                      ],
                    ),
                    CarouselSlider(
                        items: items(
                            len: state.data.images.length,
                            imageUrl: state.data.images),
                        options: CarouselOptions(
                          height: 280.h,
                          // aspectRatio: 16 / 9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, reason) =>
                              BlocProvider.of<ChangerunnerindexCubit>(context)
                                  .changeRunnerIndex(index: index),
                          scrollDirection: Axis.horizontal,
                        )),
                    SizedBox(
                      height: 10.h,
                      width: Get.size.width,
                      child: BlocBuilder<ChangerunnerindexCubit,
                          ChangerunnerindexState>(
                        builder: (context, state) {
                          final cubit =
                              context.read<ChangerunnerindexCubit>().initial;
                          return ListView.builder(
                            padding:
                                EdgeInsets.only(left: Get.size.width / 2 - 40),
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.only(left: 100.w),
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: cubit == index
                                      ? context.color.bluePinkDark
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 20,
                              height: 8,
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      state.data.title,
                      style: AppFonts.style24Bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      state.data.description,
                      style: AppFonts.f19w500,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${state.data.price}',
                          style: AppFonts.f19w500,
                        ),
                        Customelinearbutton(
                            onTap: () {},
                            child: Text(
                              'Add to card',
                              style: AppFonts.f19w500,
                            ),
                            width: 130.w,
                            height: 40.h,
                            colors: [Colors.blue, Colors.deepPurple])
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    )
                  ],
                ),
              );
            } else {
              return Center(
                  child: Text('Not Found', style: AppFonts.style24Bold));
            }
          },
        ));
  }

  List<Widget> items({required int len, required List<dynamic> imageUrl}) {
    switch (len) {
      case 1:
        return [ProductDetailesBunner(imageUrl: imageUrl[0])];
      case 2:
        return [
          ProductDetailesBunner(imageUrl: imageUrl[0]),
          ProductDetailesBunner(imageUrl: imageUrl[1]),
        ];
      default:
        return [
          ProductDetailesBunner(imageUrl: imageUrl[0]),
          ProductDetailesBunner(imageUrl: imageUrl[1]),
          ProductDetailesBunner(imageUrl: imageUrl[2]),
        ];
    }
  }
}

class ProductDetailesBunner extends StatelessWidget {
  const ProductDetailesBunner({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(imageUrl: imageUrl));
  }
}
