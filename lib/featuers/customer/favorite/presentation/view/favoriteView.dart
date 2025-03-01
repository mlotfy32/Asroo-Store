import 'package:asroo_app/features/customer/favorite/presentation/view/widgets/favoriteViewBody.dart';
import 'package:asroo_app/features/customer/favorite/presentation/viewModel/getFavorite/get_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favoriteview extends StatelessWidget {
  const Favoriteview({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetFavoriteCubit>(
      create: (context) => GetFavoriteCubit(),
      child: Favoriteviewbody(
        productId: productId,
      ),
    );
  }
}
