import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/features/customer/home/presentation/viewModel/changerunnerindex/changerunnerindex_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Bunnerslider extends StatelessWidget {
  const Bunnerslider({super.key, required this.Url});
  final List<dynamic> Url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 150.h,
              autoPlay: true,
              onPageChanged: (index, reason) {
                BlocProvider.of<ChangerunnerindexCubit>(context)
                    .changeRunnerIndex(index: index);
              }),
          items: [
            0,
            1,
            2,
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            Url[i],
                          ),
                          fit: BoxFit.cover),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
          width: Get.size.width,
          child: BlocBuilder<ChangerunnerindexCubit, ChangerunnerindexState>(
            builder: (context, state) {
              final cubit = context.read<ChangerunnerindexCubit>().initial;
              return ListView.builder(
                padding: EdgeInsets.only(left: Get.size.width / 2 - 40),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
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
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
