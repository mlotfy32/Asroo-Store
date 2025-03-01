class Getoneproductres {
  final String title;
  final String description;
  final int price;
  final List<dynamic> images;

  Getoneproductres(
      {required this.title,
      required this.description,
      required this.price,
      required this.images});
  factory Getoneproductres.fromJson(data) {
    return Getoneproductres(
        title: data['title'],
        description: data['description'],
        price: data['price'],
        images: data['images']);
  }
}
