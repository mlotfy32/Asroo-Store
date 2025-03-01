import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/dashBoardViewBody.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/viewModel/getproducts/getAdmindata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboardview extends StatelessWidget {
  const Dashboardview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetadmindataCubit>(
      create: (context) => GetadmindataCubit(),
      child: Dashboardviewbody(),
    );
  }
}
