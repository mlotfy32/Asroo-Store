import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeselectedicon_state.dart';

class ChangeselectediconCubit extends Cubit<ChangeselectediconState> {
  ChangeselectediconCubit() : super(ChangeselectediconInitial());
  String iconState = 'homeTab';

  changeSelectedIcon({required String stateName}) {
    iconState = stateName;
    emit(Changeselectedicon(iconState: stateName));
  }
}
