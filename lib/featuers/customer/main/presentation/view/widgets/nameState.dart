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
import 'package:asroo_app/features/customer/main/presentation/viewModel/search_by_name/search_by_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Namestate extends StatelessWidget {
  Namestate({
    super.key,
    required this.state,
    required this.name,
    required this.price1,
    required this.price2,
  });
  final String state;
  final TextEditingController name;

  final TextEditingController price1;
  final TextEditingController price2;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchByNameCubit, SearchByNameState>(
      listener: (context, state) {
        if (state is SearchByNameSuccess) {
          state.productd.isEmpty
              ? Helper.FlutterToast(title: 'No Data Found', success: false)
              : Get.to(
                  () => BlocProvider<GetFavoriteCubit>(
                        create: (context) => GetFavoriteCubit(),
                        child: SearchSuccess(data: state.productd),
                      ),
                  curve: Curves.easeInCirc,
                  duration: Duration(milliseconds: 700));
        } else if (state is SearchByNameFailure) {
          Helper.FlutterToast(title: state.error, success: false);
        }
      },
      child: CustomFadeInDown(
        duration: DurationFead.durationFeadIn,
        child: Column(
          children: [
            CustomeSearchRow(
              onPriceTap: () => BlocProvider.of<ChangeSearchStateCubit>(context)
                  .changeSearchState(state: 'price'),
              state: state,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomFadeInRight(
                child: Row(
                  children: [
                    SizedBox(
                        width: Get.size.width - 10.w,
                        child: Form(
                          key: _key,
                          child: CustomTextField(
                            validator: (p0) {
                              if (name.text.isEmpty) return 'Name is required';
                            },
                            controller: name,
                            hintText: 'Search by name',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
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
                    BlocProvider.of<SearchByNameCubit>(context)
                        .searchByName(name: name.text);
                  }
                },
                child: BlocBuilder<SearchByNameCubit, SearchByNameState>(
                  builder: (context, state) {
                    return state is SearchByNameLoading
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
      ),
    );
  }
}
