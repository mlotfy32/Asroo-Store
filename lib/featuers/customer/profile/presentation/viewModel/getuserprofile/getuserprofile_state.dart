part of 'getuserprofile_cubit.dart';

@immutable
abstract class GetuserprofileState {}

class GetuserprofileInitial extends GetuserprofileState {}

class GetuserprofileLiading extends GetuserprofileState {}

class GetuserprofileSuccess extends GetuserprofileState {
  final Preofileresponse userprofile;

  GetuserprofileSuccess({required this.userprofile});
}

class GetuserprofileFailure extends GetuserprofileState {
  final String error;

  GetuserprofileFailure({required this.error});
}
