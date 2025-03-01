import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_search_state_state.dart';

class ChangeSearchStateCubit extends Cubit<ChangeSearchStateState> {
  ChangeSearchStateCubit() : super(ChangeSearchStateInitial());

  changeSearchState({required String state}) {
    emit(ChangeSearchState(searchText: state));
  }
}
