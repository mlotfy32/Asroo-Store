import 'dart:developer';

import 'package:asroo_app/core/utiles/appLogOut.dart';
import 'package:asroo_app/core/utiles/app_cubit/ChangeApp/changeApp_cubit.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/category/presentation/view/categoryView.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/dashBoardView.dart';
import 'package:asroo_app/features/admin/notification/presentation/view/notificationView.dart';
import 'package:asroo_app/features/admin/product/presentation/view/productView.dart';
import 'package:asroo_app/features/admin/user/presentation/view/usersView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Adminboard extends StatefulWidget {
  Adminboard({
    super.key,
    required this.controller,
  });
  final ZoomDrawerController controller;

  @override
  State<Adminboard> createState() => _AdminboardState();
}

class _AdminboardState extends State<Adminboard> {
  @override
  void initState() {
    BlocProvider.of<ChangeAppCubit>(context).changeBody(index: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeAppCubit, ChangeAppState>(
      listener: (context, state) {
        if (state is Changeadminbody) {
          if (state.currentAdmin == 5) {
            Applogout().logout();
          }
        }
      },
      child: Scaffold(
          backgroundColor: Dark.black1,
          appBar: AppBar(
              backgroundColor: Dark.black1,
              title: BlocBuilder<ChangeAppCubit, ChangeAppState>(
                  builder: (context, state) {
                if (state is Changeadminbody) {
                  if (state.currentAdmin == 0) {
                    return Text(
                      'Admin DashBoard',
                      style: AppFonts.f19w500.copyWith(fontSize: 22),
                    );
                  } else if (state.currentAdmin == 1) {
                    return Text(
                      'Admin Categories',
                      style: AppFonts.f19w500.copyWith(fontSize: 22),
                    );
                  } else if (state.currentAdmin == 2) {
                    return Text(
                      'Admin Products',
                      style: AppFonts.f19w500.copyWith(fontSize: 22),
                    );
                  } else if (state.currentAdmin == 3) {
                    return Text(
                      'Admin Users',
                      style: AppFonts.f19w500.copyWith(fontSize: 22),
                    );
                  } else if (state.currentAdmin == 4) {
                    return Text(
                      'Notifications',
                      style: AppFonts.f19w500.copyWith(fontSize: 22),
                    );
                  }
                }
                return Text(
                  'Admin DashBoard',
                  style: AppFonts.f19w500,
                );
              }),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      widget.controller.toggle?.call();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
              ]),
          body: BlocBuilder<ChangeAppCubit, ChangeAppState>(
              builder: (context, state) {
            if (state is Changeadminbody) {
              widget.controller.close!();
              if (state.currentAdmin == 0) {
                return Dashboardview();
              } else if (state.currentAdmin == 1) {
                return Categoryview();
              } else if (state.currentAdmin == 2) {
                return Productview();
              } else if (state.currentAdmin == 3) {
                return Usersview();
              } else if (state.currentAdmin == 4) {
                return Notificationview();
              }
            }
            return SizedBox.shrink();
          })),
    );
  }
}
