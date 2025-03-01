import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeadminbody_state.dart';

class ChangeadminbodyCubit extends Cubit<ChangeadminbodyState> {
  ChangeadminbodyCubit() : super(ChangeadminbodyInitial());

  changeBody({required int index}) {
    emit(Changeadminbody(currentAdmin: index));
    log('emited ${index}');
  }
}
