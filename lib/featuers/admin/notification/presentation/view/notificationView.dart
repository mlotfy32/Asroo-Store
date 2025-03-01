import 'package:asroo_app/features/admin/notification/presentation/view/widgets/notificationViewBody.dart';
import 'package:asroo_app/features/admin/notification/presentation/viewModel/getallnotifications/getallnotifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notificationview extends StatelessWidget {
  const Notificationview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetallnotificationsCubit>(
      create: (context) => GetallnotificationsCubit(),
      child: Notificationviewbody(),
    );
  }
}
