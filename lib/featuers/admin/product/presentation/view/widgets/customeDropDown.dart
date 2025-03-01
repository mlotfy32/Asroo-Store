import 'package:asroo_app/core/utiles/theme/dark.dart';
import 'package:flutter/material.dart';

class CustomeDropButton extends StatelessWidget {
  const CustomeDropButton({
    super.key,
    required this.categoryController,
    required this.items,
    required this.categoryId,
    required this.categoryName,
    required this.isUpdate,
  });

  final TextEditingController categoryController;
  final List<String> items;
  final int categoryId;
  final String categoryName;

  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: RotatedBox(
            quarterTurns: -1,
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
          value: isUpdate == true
              ? categoryName
              : categoryController.text == '' || categoryController.text.isEmpty
                  ? items.last
                  : categoryController.text,
          onChanged: (String? newValue) {
            categoryController.text = newValue!; // تحديث القيمة المحددة
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  value,
                  style: TextStyle(color: Dark.blueDark),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
