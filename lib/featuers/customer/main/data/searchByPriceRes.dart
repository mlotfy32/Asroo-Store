class Searchbypriceres {
  final String title;
  final String id;
  final int price;
  final String description;
  final List<dynamic> images;

  Searchbypriceres(
      {required this.title,
      required this.price,
      required this.id,
      required this.description,
      required this.images});
  factory Searchbypriceres.fromJson(data) {
    return Searchbypriceres(
        title: data['title'],
        price: data['price'],
        id: data['id'],
        description: data['description'],
        images: data['images']);
  }
}
