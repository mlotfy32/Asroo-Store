class Updatecategoryresponse {
  final String id;
  final String name;
  final String image;

  Updatecategoryresponse(
      {required this.id, required this.name, required this.image});
  factory Updatecategoryresponse.fromJson(data) => Updatecategoryresponse(
      id: data['id'], name: data['name'], image: data['image']);
}

class UpdatecategoryFailuer {
  final String message;

  UpdatecategoryFailuer({required this.message});
}
