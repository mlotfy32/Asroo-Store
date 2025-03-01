import 'package:asroo_app/features/customer/profile/presentation/view/widgets/profileViewBody.dart';
import 'package:asroo_app/features/customer/profile/presentation/viewModel/getuserprofile/getuserprofile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetuserprofileCubit>(
      create: (context) => GetuserprofileCubit(),
      child: Profileviewbody(),
    );
  }
}
