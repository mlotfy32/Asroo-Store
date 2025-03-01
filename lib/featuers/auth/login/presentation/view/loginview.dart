import 'package:asroo_app/features/auth/login/presentation/view/widgets/login_viewBody.dart';
import 'package:asroo_app/features/auth/login/presentation/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: LoginViewbody(),
    );
  }
}
