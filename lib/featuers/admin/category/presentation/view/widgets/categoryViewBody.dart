import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/category/data/model/categoriesResponse.dart';
import 'package:asroo_app/features/admin/category/presentation/view/widgets/categorieItem.dart';
import 'package:asroo_app/features/admin/category/presentation/view/widgets/createCategory.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/createcategory/createcategory_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/deletecategory/deletecategory_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/updatecategory/updatecategory_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categoryviewbody extends StatefulWidget {
  const Categoryviewbody({super.key});

  @override
  State<Categoryviewbody> createState() => _CategoryviewbodyState();
}

class _CategoryviewbodyState extends State<Categoryviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
    super.initState();
  }

  List<Categoriesresponse> data = [];
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatecategoryCubit, UpdatecategoryState>(
      listener: (context, state) {
        if (state is UpdatecategoryLoading) {
          Helper.customeLoadingSnac(title: 'Updating Category');
        } else if (state is UpdatecategorySuccess) {
          Helper.FlutterToast(title: 'Category Updated', success: true);
          BlocProvider.of<GetallcategoriesCubit>(context).getAllCategories();
        } else if (state is UpdatecategoryFailure) {
          Helper.FlutterToast(title: state.error, success: false);
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Get All Categories',
                style: AppFonts.style24Bold
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Customelinearbutton(
                  colors: [Dark.blueDark, Dark.blueDark],
                  onTap: () {
                    Get.bottomSheet(
                        MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value: CreatecategoryCubit(),
                              ),
                              BlocProvider.value(
                                value: GetallcategoriesCubit(),
                              ),
                              BlocProvider.value(
                                value: UpdatecategoryCubit(),
                              ),
                              BlocProvider<UploadimageCubit>(
                                create: (context) => UploadimageCubit(),
                              ),
                            ],
                            child: CreateCategory(
                              isUpdate: false,
                            )),
                        isScrollControlled: true,
                        isDismissible: true);
                  },
                  child: Text(
                    'Add',
                    style: AppFonts.style24Bold.copyWith(fontSize: 20),
                  ),
                  width: 90.w,
                  height: 40.h),
            ],
          ),
          Expanded(
            child: BlocBuilder<GetallcategoriesCubit, GetallcategoriesState>(
              builder: (context, state) {
                state is GetallcategoriesSuccess ? data = state.categories : [];
                return RefreshIndicator(
                  onRefresh: () =>
                      BlocProvider.of<GetallcategoriesCubit>(context)
                          .getAllCategories(),
                  child: ListView.builder(
                    itemBuilder: (context, index) => MultiBlocProvider(
                      providers: [
                        BlocProvider<DeletecategoryCubit>(
                          create: (context) => DeletecategoryCubit(),
                        ),
                        BlocProvider<UpdatecategoryCubit>(
                          create: (context) => UpdatecategoryCubit(),
                        ),
                      ],
                      child: CategorieItem(
                          id: data[index].id,
                          isLoading:
                              state is GetallcategoriesLoading ? true : false,
                          image: data[index].image,
                          title: data[index].name),
                    ),
                    itemCount: data.length,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
