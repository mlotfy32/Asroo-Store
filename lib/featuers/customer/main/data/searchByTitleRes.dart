class Searchbytitleres {
  final String title;
  final String id;

  final int price;
  final String description;
  final List<dynamic> images;

  Searchbytitleres(
      {required this.title,
      required this.id,
      required this.price,
      required this.description,
      required this.images});
  factory Searchbytitleres.fromJson(data) {
    return Searchbytitleres(
        title: data['title'],
        price: data['price'],
        id: data['id'],
        description: data['description'],
        images: data['images']);
  }
}
