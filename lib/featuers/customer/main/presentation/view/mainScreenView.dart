import 'package:asroo_app/core/utiles/app_cubit/dynamiclink/dynamiclink_cubit.dart';
import 'package:asroo_app/features/customer/main/presentation/view/widgets/mainScreenViewBody.dart';
import 'package:asroo_app/features/customer/main/presentation/viewModel/changeselectedicon/changeselectedicon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mainscreenview extends StatelessWidget {
  const Mainscreenview({super.key});
//SearchBtPriceCubit
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ChangeselectediconCubit>(
          create: (context) => ChangeselectediconCubit()),
      BlocProvider<DynamiclinkCubit>(create: (context) => DynamiclinkCubit()),
    ], child: Mainscreenviewbody());
  }
}
