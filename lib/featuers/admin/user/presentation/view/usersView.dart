import 'package:asroo_app/features/admin/user/presentation/view/widgets/usersViewBody.dart';
import 'package:asroo_app/features/admin/user/presentation/viewmodel/getallusers/getallusers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Usersview extends StatelessWidget {
  const Usersview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetallusersCubit>(
      create: (context) => GetallusersCubit(),
      child: Usersviewbody(),
    );
  }
}
