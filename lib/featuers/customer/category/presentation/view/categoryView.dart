import 'package:asroo_app/features/admin/category/presentation/viewModel/getallcategories/getallcategories_cubit.dart';
import 'package:asroo_app/features/customer/category/presentation/view/widgets/categoryNavBarBody.dart';
import 'package:asroo_app/features/customer/category/presentation/view/widgets/categoryViewBody.dart';
import 'package:asroo_app/features/customer/category/presentation/viewModel/getcustomecategory/getcustomecategory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categoryview extends StatelessWidget {
  const Categoryview({super.key, required this.id, required this.title});
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return id == ''
        ? BlocProvider<GetallcategoriesCubit>(
            create: (context) => GetallcategoriesCubit(),
            child: Categorynavbarbody(),
          )
        : BlocProvider<GetcustomecategoryCubit>(
            create: (context) => GetcustomecategoryCubit(),
            child: Categoryviewbody(
              id: id,
              title: title,
            ),
          );
  }
}
