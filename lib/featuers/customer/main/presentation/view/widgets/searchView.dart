import 'dart:developer';

import 'package:asroo_app/core/utiles/durations.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/customeSearchRow.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/nameState.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/searchSuccess.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/priceState.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/change_search_state/change_search_state_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/search_by_name/search_by_name_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/search_by_price/search_bt_price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Searchview extends StatefulWidget {
  Searchview({super.key});

  @override
  State<Searchview> createState() => _SearchviewState();
}

class _SearchviewState extends State<Searchview> {
  TextEditingController name = TextEditingController();

  TextEditingController price1 = TextEditingController();

  TextEditingController price2 = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    price1.dispose();
    price2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 10.w),
              Customelinearbutton(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Colors.white,
                  ),
                  width: 55.w,
                  height: 40.h,
                  colors: [
                    Dark.blueLight,
                    Dark.blueDark,
                  ]),
              SizedBox(
                width: Get.size.width / 2 - 100.w,
              ),
              Text(
                'Search',
                style: AppFonts.style24Bold,
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          BlocBuilder<ChangeSearchStateCubit, ChangeSearchStateState>(
            builder: (context, state) {
              if (state is ChangeSearchState && state.searchText == 'price') {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<SearchBtPriceCubit>(
                      create: (context) => SearchBtPriceCubit(),
                    ),
                  ],
                  child: Pricestate(
                      state: state.searchText,
                      price1: price1,
                      price2: price2,
                      name: name),
                );
              } else if (state is ChangeSearchState &&
                  state.searchText == 'name') {
                return BlocProvider<SearchByNameCubit>(
                  create: (context) => SearchByNameCubit(),
                  child: Namestate(
                      state: state.searchText,
                      name: name,
                      price1: price1,
                      price2: price2),
                );
              }
              return CustomFadeInLeft(
                duration: DurationFead.durationFeadIn,
                child: Column(
                  children: [
                    CustomeSearchRow(
                      onNameTap: () =>
                          BlocProvider.of<ChangeSearchStateCubit>(context)
                              .changeSearchState(state: 'name'),
                      onPriceTap: () =>
                          BlocProvider.of<ChangeSearchStateCubit>(context)
                              .changeSearchState(state: 'price'),
                      state: '',
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      'Search For Data',
                      style: AppFonts.style24Bold,
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
