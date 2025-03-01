class Getallusersres {
  final String id;
  final String name;
  final String email;

  Getallusersres({required this.id, required this.name, required this.email});
  factory Getallusersres.fromJson(data) {
    return Getallusersres(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }
}
