import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en'); // اللغة الافتراضية هي الإنجليزية

  void changeLanguage(String languageCode) {
    emit(languageCode); // تغيير اللغة
  }
}
