part of 'dynamiclink_cubit.dart';

@immutable
abstract class DynamiclinkState {}

class DynamiclinkInitial extends DynamiclinkState {}

class DynamiclinkLoading extends DynamiclinkState {}

class DynamiclinkSuccess extends DynamiclinkState {}

class DynamiclinkInikFailure extends DynamiclinkState {}
