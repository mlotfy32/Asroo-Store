part of 'getallusers_cubit.dart';

@immutable
abstract class GetallusersState {}

class GetallusersInitial extends GetallusersState {}

class GetallusersLoading extends GetallusersState {}

class GetallusersSuccess extends GetallusersState {
  final List<Getallusersres> users;

  GetallusersSuccess({required this.users});
}

class GetallusersFailure extends GetallusersState {
  final String error;

  GetallusersFailure({required this.error});
}

class GetUserLoading extends GetallusersState {}

class GetUserSuccess extends GetallusersState {
  final Getallusersres user;

  GetUserSuccess({required this.user});
}

class GetUserFailure extends GetallusersState {
  final String error;

  GetUserFailure({required this.error});
}
