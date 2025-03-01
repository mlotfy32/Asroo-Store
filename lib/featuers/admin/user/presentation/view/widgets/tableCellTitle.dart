import 'package:asroo_app/features/admin/user/presentation/view/widgets/customeTableText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableCellTitle extends StatelessWidget {
  const TableCellTitle({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomeTableText(title: title),
          SizedBox(
            width: 5.w,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}
