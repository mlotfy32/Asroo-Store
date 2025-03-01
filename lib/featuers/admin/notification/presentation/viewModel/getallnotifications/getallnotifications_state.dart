part of 'getallnotifications_cubit.dart';

@immutable
abstract class GetallnotificationsState {}

class GetallnotificationsInitial extends GetallnotificationsState {}

class GetallnotificationsLoading extends GetallnotificationsState {}

class GetallnotificationsEmpty extends GetallnotificationsState {}

class GetallnotificationsSuccess extends GetallnotificationsState {
  final List<NotificationModel> data;

  GetallnotificationsSuccess({required this.data});
}

class GetallnotificationsFailure extends GetallnotificationsState {
  final String error;

  GetallnotificationsFailure({required this.error});
}
