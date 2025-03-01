import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/user/data/models/getAllUsersRes.dart';
import 'package:asroo_app/features/admin/user/presentation/view/widgets/customeTable.dart';
import 'package:asroo_app/features/admin/user/presentation/view/widgets/customeTableText.dart';
import 'package:asroo_app/features/admin/user/presentation/view/widgets/usersTable.dart';
import 'package:asroo_app/features/admin/user/presentation/viewmodel/deleteuser/deleteuser_cubit.dart';
import 'package:asroo_app/features/admin/user/presentation/viewmodel/getallusers/getallusers_cubit.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/3.3%20custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Usersviewbody extends StatefulWidget {
  const Usersviewbody({super.key});

  @override
  State<Usersviewbody> createState() => _UsersviewbodyState();
}

class _UsersviewbodyState extends State<Usersviewbody> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<GetallusersCubit>(context).getAllUsers();
    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  List<Getallusersres> data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomTextField(
            onFieldSubmitted: (p0) {
              BlocProvider.of<GetallusersCubit>(context)
                  .getUser(data: data, name: search.text);
            },
            hintStyle: AppFonts.hintStyle,
            hintText: 'Search for users',
            controller: search,
            suffixIcon: Icon(
              Icons.close,
              color: Dark.blueDark,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          RefreshIndicator(onRefresh: () async {
            BlocProvider.of<GetallusersCubit>(context).getAllUsers();
          }, child: BlocBuilder<GetallusersCubit, GetallusersState>(
            builder: (context, state) {
              if (state is GetallusersLoading) {
                return Center(
                  child: Helper.customeLoadingwidget(size: 120),
                );
              } else if (state is GetallusersSuccess) {
                data = state.users;
                return SizedBox(
                  height: Get.size.height - 150.h,
                  child: ListView(children: [
                    BlocProvider<DeleteuserCubit>(
                      create: (context) => DeleteuserCubit(),
                      child: Userstable(
                        data: state.users,
                      ),
                    ),
                  ]),
                );
              } else if (state is GetallusersFailure) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppFonts.style24Bold.copyWith(color: Colors.red),
                  ),
                );
              } else if (state is GetUserLoading) {
                return Center(
                  child: Helper.customeLoadingwidget(size: 120),
                );
              } else if (state is GetUserSuccess) {
                return SizedBox(
                  height: Get.size.height - 150.h,
                  child: BlocProvider<DeleteuserCubit>(
                    create: (context) => DeleteuserCubit(),
                    child: CustomeTable(
                      email: state.user.email,
                      name: state.user.name,
                      id: state.user.id,
                    ),
                  ),
                );
              } else if (state is GetUserFailure) {
                return RefreshIndicator(
                  child: SizedBox(
                    height: Get.size.height - 150.h,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: Get.size.height / 2.h,
                              left: Get.size.width / 2 - 65.w),
                          child: CustomeTableText(title: '${state.error}'),
                        )
                      ],
                    ),
                  ),
                  onRefresh: () async {
                    BlocProvider.of<GetallusersCubit>(context).getAllUsers();
                    search.clear();
                  },
                );
              }
              return Center(
                child: Helper.customeLoadingwidget(size: 120),
              );
            },
          )),
        ],
      ),
    );
  }
}
