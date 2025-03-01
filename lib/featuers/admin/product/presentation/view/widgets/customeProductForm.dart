import 'package:asroo_app/core/utiles/style/font_Styles/app_fonts.dart';
import 'package:asroo_app/features/admin/product/presentation/view/widgets/customeDropDown.dart';
import 'package:asroo_app/features/auth/login/presentation/view/widgets/3.3%20custom_text_field.dart';
import 'package:flutter/material.dart';

class Customeproductform extends StatelessWidget {
  Customeproductform(
      {super.key,
      this.formKey,
      required this.isUpdate,
      required this.titleController,
      required this.priceController,
      required this.descriptionController,
      required this.title,
      required this.price,
      required this.description,
      required this.categoryController,
      this.titcategoryle,
      required this.category,
      required this.categoryName});
  final formKey;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController categoryController;
  final title;
  final titcategoryle;
  final int category;
  final String categoryName;
  final price;
  final description;
  final bool isUpdate;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the Product Title',
              style: AppFonts.f19w500,
              textAlign: TextAlign.left,
            ),
            CustomTextField(
              validator: (text) {
                if (text!.isEmpty || text == '') {
                  return 'Product title is required';
                }
              },
              controller: titleController,
              hintText: isUpdate == true ? '$title' : 'Title',
              hintStyle: AppFonts.hintStyle,
            ),
            Text(
              'Enter the Product Price',
              style: AppFonts.f19w500,
              textAlign: TextAlign.left,
            ),
            CustomTextField(
              keyboardType: TextInputType.number,
              validator: (text) {
                if (text!.isEmpty || text == '') {
                  return 'Product price is required';
                }
              },
              controller: priceController,
              hintText: isUpdate == true ? '$price' : 'Price',
              hintStyle: AppFonts.hintStyle,
            ),
            Text(
              'Enter the Product Description',
              style: AppFonts.f19w500,
              textAlign: TextAlign.left,
            ),
            CustomTextField(
              validator: (text) {
                if (text!.isEmpty || text == '') {
                  return 'Product description is required';
                }
              },
              maxLines: 3,
              controller: descriptionController,
              hintText: isUpdate == true ? '$description' : 'Description',
              hintStyle: AppFonts.hintStyle,
            ),
            Text(
              'Chose the Product Category',
              style: AppFonts.f19w500,
              textAlign: TextAlign.left,
            ),
            CustomTextField(
              readOnly: true,
              validator: (value) {
                if (value!.isEmpty || value == '')
                  return 'Product Category is required';
              },
              suffixIcon: CustomeDropButton(
                  categoryName: categoryName,
                  isUpdate: isUpdate,
                  categoryId: category,
                  categoryController: categoryController,
                  items: items),
              controller: categoryController,
              hintText: isUpdate == true ? items[category - 1] : 'Category',
              hintStyle: AppFonts.hintStyle,
            ),
          ],
        ));
  }

  // String selectedValue = 'Option 1'; // القيمة المحددة حاليًا
  List<String> items = [
    'Clothes',
    'Electronics',
    'Furniture',
    'Shoes',
    'Miscellaneous',
    'Category'
  ];
}
