class SignupresponseSuccess {
  final String name;
  final String avatar;

  final String id;
  SignupresponseSuccess(
      {required this.name, required this.avatar, required this.id});

  factory SignupresponseSuccess.fromJson(data) => SignupresponseSuccess(
        name: data['name'],
        avatar: data['avatar'],
        id: data['id'],
      );
}

class SignupresponseFailure {
  final String message;
  SignupresponseFailure({required this.message});
}
