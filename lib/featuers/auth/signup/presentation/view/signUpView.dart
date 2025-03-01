import 'package:asroo_app/features/auth/signup/presentation/view/widgets/signUpViewBody.dart';
import 'package:asroo_app/features/auth/signup/presentation/viewModel/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupCubit>(
      create: (context) => SignupCubit(),
      child: Signupviewbody(),
    );
  }
}
