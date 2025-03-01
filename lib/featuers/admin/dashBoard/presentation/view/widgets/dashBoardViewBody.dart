import 'package:asroo_app/core/utiles/style/images/app_images.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/view/widgets/dashBoardContent.dart';
import 'package:asroo_app/features/admin/dashBoard/presentation/viewModel/getproducts/getAdmindata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboardviewbody extends StatefulWidget {
  const Dashboardviewbody({super.key});

  @override
  State<Dashboardviewbody> createState() => _DashboardviewbodyState();
}

class _DashboardviewbodyState extends State<Dashboardviewbody> {
  @override
  void initState() {
    BlocProvider.of<GetadmindataCubit>(context).getProductslen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GetadmindataCubit>(context).getProductslen();
        },
        child: ListView.builder(
          itemBuilder: (context, index) =>
              BlocBuilder<GetadmindataCubit, GetAdminDataState>(
                  builder: (context, state) {
            return DashBoardContent(
              title: index == 0
                  ? 'Products'
                  : index == 1
                      ? 'Categories'
                      : 'Users',
              count: state is GetAdminDataSuccess
                  ? state.adminData[index].toString()
                  : '!',
              image: index == 0
                  ? AppImages.productsDrawer
                  : index == 1
                      ? AppImages.categoriesDrawer
                      : AppImages.usersDrawer,
              isLoading: state is GetAdminDataLoading ? true : false,
            );
          }),
          itemCount: 3,
        ),
      ),
    );
  }
}
