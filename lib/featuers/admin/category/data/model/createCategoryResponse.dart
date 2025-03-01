class Createcategoryresponse {
  final String id;
  final String name;
  final String image;

  Createcategoryresponse(
      {required this.id, required this.name, required this.image});
  factory Createcategoryresponse.fromJson(data) => Createcategoryresponse(
      id: data['id'], name: data['name'], image: data['image']);
}
