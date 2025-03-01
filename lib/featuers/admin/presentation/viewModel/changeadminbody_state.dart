part of 'changeadminbody_cubit.dart';

@immutable
abstract class ChangeadminbodyState {}

class ChangeadminbodyInitial extends ChangeadminbodyState {}

class Changeadminbody extends ChangeadminbodyState {
  final int currentAdmin;

  Changeadminbody({required this.currentAdmin});
}
