part of 'sendnotification_cubit.dart';

@immutable
abstract class SendnotificationState {}

class SendnotificationInitial extends SendnotificationState {}

class SendnotificationLoading extends SendnotificationState {}

class SendnotificationSuccess extends SendnotificationState {}

class SendnotificationFailure extends SendnotificationState {}
