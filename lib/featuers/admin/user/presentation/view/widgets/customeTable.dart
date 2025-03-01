import 'package:asroo_app/core/utiles/helper.dart';
import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:asroo_app/features/admin/user/presentation/view/widgets/customeTableText.dart';
import 'package:asroo_app/features/admin/user/presentation/view/widgets/tableCellTitle.dart';
import 'package:asroo_app/features/admin/user/presentation/viewmodel/deleteuser/deleteuser_cubit.dart';
import 'package:asroo_app/features/admin/user/presentation/viewmodel/getallusers/getallusers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomeTable extends StatelessWidget {
  const CustomeTable({
    super.key,
    required this.name,
    required this.email,
    required this.id,
  });
  final String name;
  final String email;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteuserCubit, DeleteuserState>(
      listener: (context, state) {
        if (state is DeleteUserLoading) {
          Helper.customeLoadingSnac(title: 'Deleting User');
        } else if (state is DeleteUserSuccess) {
          Helper.FlutterToast(
              title: 'User Deleted Successfully', success: true);
          BlocProvider.of<GetallusersCubit>(context).getAllUsers();
        } else if (state is DeleteUserFailure) {
          Helper.FlutterToast(title: state.error, success: true);
        }
      },
      child: Table(
        border: TableBorder.all(
          color: Dark.blueLight,
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(100.w),
          1: FlexColumnWidth(110.w),
          2: FlexColumnWidth(100.w),
        },
        children: [
          TableRow(decoration: BoxDecoration(color: Dark.blueDark), children: [
            //name
            TableCell(
              child: TableCellTitle(title: 'Delete', icon: Icons.delete),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            //email

            TableCell(
              child: TableCellTitle(title: 'Email', icon: Icons.email_outlined),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            //delete

            TableCell(
              child: TableCellTitle(title: 'Name', icon: Icons.person),
              verticalAlignment: TableCellVerticalAlignment.middle,
            )
          ]),
          ...List.generate(
              1,
              (index) => TableRow(children: [
                    TableCell(
                      child: InkWell(
                          onTap: () {
                            BlocProvider.of<DeleteuserCubit>(context)
                                .deleteUser(id: int.parse(id));
                          },
                          child: Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.red,
                          )),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomeTableText(title: email),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomeTableText(title: name),
                      ),
                      verticalAlignment: TableCellVerticalAlignment.middle,
                    ),
                  ]))
        ],
      ),
    );
  }
}
/*

*/
