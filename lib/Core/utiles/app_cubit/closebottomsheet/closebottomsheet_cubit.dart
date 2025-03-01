import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'closebottomsheet_state.dart';

class ClosebottomsheetCubit extends Cubit<ClosebottomsheetState> {
  ClosebottomsheetCubit() : super(ClosebottomsheetInitial());

  void closebottomsheet() {
    emit(Closebottomsheet());
  }
}
