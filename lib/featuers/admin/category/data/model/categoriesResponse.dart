class Categoriesresponse {
  final String id;
  final String name;
  final String image;

  Categoriesresponse(
      {required this.id, required this.name, required this.image});
  factory Categoriesresponse.fromJson(data) => Categoriesresponse(
      id: data['id'], name: data['name'], image: data['image']);
}
