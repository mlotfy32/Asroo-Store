import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/presentation/view/widgets/adminMenue.dart';
import 'package:asroo_app/features/admin/presentation/view/widgets/adminBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AdminViewbody extends StatelessWidget {
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuScreen: AdminMenue(),
      mainScreen: Adminboard(
        controller: _zoomDrawerController,
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -15.0,
      drawerShadowsBackgroundColor: Dark.black1,
    );
  }
}
