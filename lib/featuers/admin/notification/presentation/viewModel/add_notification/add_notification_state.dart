part of 'add_notification_cubit.dart';

@immutable
abstract class AddNotificationState {}

class AddNotificationInitial extends AddNotificationState {}

class AddNotificationLoading extends AddNotificationState {}

class AddNotificationSuccess extends AddNotificationState {}

class AddNotificationFailure extends AddNotificationState {
  final String errorMessage;

  AddNotificationFailure({required this.errorMessage});
}
