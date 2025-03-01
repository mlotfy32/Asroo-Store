import 'package:asroo_app/features/admin/category/presentation/viewModel/deletecategory/deletecategory_cubit.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/productViewBody.dart';
import 'package:asroo_app/features/admin/product/presentation/viewModel/getallproducts/getallproducts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productview extends StatelessWidget {
  const Productview({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GetallproductsCubit>(
          create: (context) => GetallproductsCubit()),
      BlocProvider<DeletecategoryCubit>(
          create: (context) => DeletecategoryCubit()),
    ], child: Productviewbody());
  }
}
