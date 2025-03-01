import 'package:intl/intl.dart';

extension DateEx on DateTime {
  String getFormate() {
    final formateDate = DateFormat('dd/MM/yyyy');

    return formateDate.format(this);
  }
}
