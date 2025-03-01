part of 'getAdmindata_cubit.dart';

@immutable
abstract class GetAdminDataState {}

class GetAdminDataInitial extends GetAdminDataState {}

class GetAdminDataLoading extends GetAdminDataState {}

class GetAdminDataSuccess extends GetAdminDataState {
  final List adminData;

  GetAdminDataSuccess({required this.adminData});
}

class GetAdminDataFailure extends GetAdminDataState {
  final String errorMessage;

  GetAdminDataFailure({required this.errorMessage});
}
