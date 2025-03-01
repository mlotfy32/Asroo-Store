part of 'changeselectedicon_cubit.dart';

@immutable
abstract class ChangeselectediconState {}

class ChangeselectediconInitial extends ChangeselectediconState {}

class Changeselectedicon extends ChangeselectediconState {
  final String iconState;

  Changeselectedicon({required this.iconState});
}
