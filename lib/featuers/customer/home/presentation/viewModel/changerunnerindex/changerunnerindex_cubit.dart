import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changerunnerindex_state.dart';

class ChangerunnerindexCubit extends Cubit<ChangerunnerindexState> {
  ChangerunnerindexCubit() : super(ChangerunnerindexInitial());
  int initial = 0;
  changeRunnerIndex({required int index}) {
    initial = index;
    emit(Changerunnerindex());
  }
}
