part of 'changeApp_cubit.dart';

@immutable
abstract class ChangeAppState {}

class ChangeAppInitial extends ChangeAppState {}

class Changetheme extends ChangeAppState {
  final bool isDarkMode;

  Changetheme({required this.isDarkMode});
} //

class Changelanguage extends ChangeAppState {
  final String language;

  Changelanguage({required this.language});
}

class Changeadminbody extends ChangeAppState {
  final int currentAdmin;

  Changeadminbody({required this.currentAdmin});
}
