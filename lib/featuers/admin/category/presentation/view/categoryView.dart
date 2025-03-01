import 'package:asroo_app/features/admin/category/presentation/view/widgets/categoryViewBody.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/admin/category/presentation/viewModel/updatecategory/updatecategory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categoryview extends StatelessWidget {
  const Categoryview({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GetallcategoriesCubit>(
          create: (context) => GetallcategoriesCubit()),
      BlocProvider.value(
        value: UpdatecategoryCubit(),
      )
    ], child: Categoryviewbody());
  }
}
