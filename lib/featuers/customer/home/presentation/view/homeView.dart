import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/getallproducts/getallproducts_cubit.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/addtofavorite/addtofavorite_cubit.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/getFavorite/get_favorite_cubit.dart';
import 'package:asroo_app/features/customer/home/presentation/view/widgets/homeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GetallcategoriesCubit>(
        create: (context) => GetallcategoriesCubit(),
      ),
      BlocProvider<GetallproductsCubit>(
        create: (context) => GetallproductsCubit(),
      ),
      BlocProvider<AddtofavoriteCubit>(
        create: (context) => AddtofavoriteCubit(),
      ),
      BlocProvider<GetFavoriteCubit>(
        create: (context) => GetFavoriteCubit(),
      ),
    ], child: Homeviewbody(controller: controller));
  }
}
