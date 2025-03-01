class Preofileresponse {
  final int id;
  final String name;
  final String avatar;
  final String email;
  final String role;

  Preofileresponse(
      {required this.email,
      required this.role,
      required this.id,
      required this.name,
      required this.avatar});
  factory Preofileresponse.fromJson(data) {
    return Preofileresponse(
        id: data['id'],
        name: data['name'],
        avatar: data['avatar'],
        email: data['email'],
        role: data['role']);
  }
}
