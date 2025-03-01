import 'package:asroo_app/core/utiles/app_cubit/uploadimage/uploadimage_cubit.dart';
import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/deletecategory/deletecategory_cubit.dart';
import 'package:asroo_app/features/admin/product/data/models/getAllProductsRes.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/createProduct.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/productItem.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/createproduct/createproduct_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/getallproducts/getallproducts_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/updateproduct/updateproduct_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/customeLinearButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Productviewbody extends StatefulWidget {
  const Productviewbody({super.key});

  @override
  State<Productviewbody> createState() => _ProductviewbodyState();
}

class _ProductviewbodyState extends State<Productviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetallproductsCubit>(context).getAllProducts();
    super.initState();
  }

  List<Getallproductsres> data = [];
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeletecategoryCubit, DeletecategoryState>(
      listener: (context, state) {
        if (state is DeletecategoryLoading) {
          Helper.customeLoadingSnac(title: '...Deleting Product');
        } else if (state is DeletecategorySuccess) {
          Helper.FlutterToast(title: 'Product Deleted', success: true);
          BlocProvider.of<GetallproductsCubit>(context).getAllProducts();
        } else if (state is DeletecategoryFailure) {
          Helper.FlutterToast(title: state.errorMessage, success: false);
        }
      },
      child: Container(
          color: Dark.black2,
          child: RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GetallproductsCubit>(context).getAllProducts();
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Get All Products',
                        style: AppFonts.style24Bold.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Customelinearbutton(
                          colors: [Dark.blueDark, Dark.blueDark],
                          onTap: () {
                            Get.bottomSheet(
                                MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: GetallproductsCubit(),
                                    ),
                                    BlocProvider.value(
                                      value: CreateproductCubit(),
                                    ),
                                    BlocProvider.value(
                                      value: UpdateproductCubit(),
                                    ),
                                    BlocProvider(
                                      create: (context) => UploadimageCubit(),
                                    ),
                                  ],
                                  child: Createproduct(
                                    categoryName: '',
                                    category: 0,
                                    id: '',
                                    url: '',
                                    description: '',
                                    name: '',
                                    price: 0,
                                    title: '',
                                    isUpdate: false,
                                  ),
                                ),
                                isScrollControlled: true,
                                enableDrag: true,
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
                    child:
                        BlocBuilder<GetallproductsCubit, GetallproductsState>(
                      builder: (context, state) {
                        if (state is GetallproductsLoading) {
                          return GridView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) => ProductsItems(
                              categoryName: '',
                              isLoading: true,
                              category: 0,
                              description: '',
                              name: '',
                              title: '',
                              Url: '',
                              id: '',
                              price: 0,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 280.h,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0),
                          );
                        } else if (state is GetallproductsSuccess) {
                          data = state.products;
                          return GridView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) => ProductsItems(
                              categoryName: data[index].categories.name,
                              category: int.parse(data[index].categories.id),
                              isLoading: false,
                              description: data[index].description,
                              id: data[index].id,
                              name: data[index].categories.name,
                              price: data[index].price,
                              title: data[index].title,
                              Url: data[index].images[0][0] == '['
                                  ? data[index].images[0].substring(
                                      2, data[index].images[0].length - 2)
                                  : data[index].images[0],
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 280.h,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0),
                          );
                        } else if (state is GetallproductsFailure) {
                          return Center(
                            child: Text(state.error,
                                style: AppFonts.style24Bold
                                    .copyWith(color: Colors.red)),
                          );
                        }
                        return ProductsItems(
                          category: 0,
                          categoryName: '',
                          isLoading: true,
                          Url: '',
                          description: '',
                          id: '',
                          name: '',
                          price: 0,
                          title: '',
                        );
                      },
                    ),
                  ),
                ],
              ))),
    );
  }
}
