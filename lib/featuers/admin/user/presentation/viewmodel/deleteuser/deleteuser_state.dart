part of 'deleteuser_cubit.dart';

@immutable
abstract class DeleteuserState {}

class DeleteuserInitial extends DeleteuserState {}

class DeleteUserLoading extends DeleteuserState {}

class DeleteUserSuccess extends DeleteuserState {}

class DeleteUserFailure extends DeleteuserState {
  final String error;

  DeleteUserFailure({required this.error});
}
