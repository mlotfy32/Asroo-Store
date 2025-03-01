import 'dart:developer';

import 'package:asroo_app/core/utiles/durations.dart';
import 'package:asroo_app/core/utiles/extensions/extensions.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/3.3%20custom_text_field.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/custome_text.dart';
import 'package:asroo_app/features/customer/animation/3.1%20animate_do.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/getFavorite/get_favorite_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/customeSearchRow.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/searchSuccess.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/change_search_state/change_search_state_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/search_by_price/search_bt_price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Pricestate extends StatelessWidget {
  Pricestate(
      {super.key,
      required this.state,
      required this.price1,
      required this.price2,
      required this.name});
  final String state;
  final TextEditingController name;

  final TextEditingController price1;
  final TextEditingController price2;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBtPriceCubit, SearchBtPriceState>(
      listener: (context, state) {
        if (state is SearchByPriceSuccess) {
          state.productd.isEmpty
              ? Helper.FlutterToast(title: 'No Data Found', success: false)
              : Get.to(
                  () => BlocProvider<GetFavoriteCubit>(
                        create: (context) => GetFavoriteCubit(),
                        child: SearchSuccess(
                          data: state.productd,
                        ),
                      ),
                  curve: Curves.easeInCirc,
                  duration: Duration(milliseconds: 700));
        } else if (state is SearchByPriceFailure) {
          Helper.FlutterToast(title: state.error, success: false);
        }
      },
      child: Column(
        children: [
          CustomeSearchRow(
              state: state,
              onNameTap: () => BlocProvider.of<ChangeSearchStateCubit>(context)
                  .changeSearchState(state: 'name')),
          SizedBox(
            height: 50.h,
          ),
          CustomFadeInRight(
              child: Form(
                key: _key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 160.w,
                        child: CustomTextField(
                          validator: (p0) {
                            if (price1.text.isEmpty)
                              return 'Min price is required';
                          },
                          controller: price1,
                          hintText: 'Min Price',
                          keyboardType: TextInputType.number,
                        )),
                    SizedBox(
                        width: 160.w,
                        child: CustomTextField(
                          controller: price2,
                          validator: (p0) {
                            if (price2.text.isEmpty)
                              return 'Max price is required';
                          },
                          hintText: 'Max Price',
                          keyboardType: TextInputType.number,
                        )),
                  ],
                ),
              ),
              duration: DurationFead.durationFeadIn),
          SizedBox(height: 80.h),
          Customelinearbutton(
              colors: [
                context.color.bluePinkLight!,
                context.color.bluePinkDark!
              ],
              onTap: () {
                if (_key.currentState!.validate()) {
                  BlocProvider.of<SearchBtPriceCubit>(context)
                      .searchByPrice(min: price1.text, max: price2.text);
                }
              },
              child: BlocBuilder<SearchBtPriceCubit, SearchBtPriceState>(
                builder: (context, state) {
                  return state is SearchByPriceLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : TextApp(
                          text: 'Search',
                          theme: context.textStyle.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w700));
                },
              ),
              width: MediaQuery.sizeOf(context).width,
              height: 40.h),
        ],
      ),
    );
  }
}
