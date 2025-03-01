class LoginResponseSuccess {
  final String access_token;
  final String refresh_token;
  LoginResponseSuccess(
      {required this.access_token, required this.refresh_token});
  factory LoginResponseSuccess.fromJson(data) => LoginResponseSuccess(
        access_token: data['access_token'],
        refresh_token: data['refresh_token'],
      );
}

class LoginResponseFailure {
  final String message;
  LoginResponseFailure({required this.message});
}
