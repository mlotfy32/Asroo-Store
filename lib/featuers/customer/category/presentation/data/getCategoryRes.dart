class Categoryres {
  final String title;
  final int price;
  List<dynamic> images;
  final Category category;
  Categoryres(
      {required this.images,
      required this.category,
      required this.title,
      required this.price});
  factory Categoryres.fromJson(data) {
    return Categoryres(
      images: data['images'],
      title: data['title'],
      price: data['price'],
      category: Category.fromJson(data['category']),
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
  factory Category.fromJson(data) {
    return Category(
      id: data['id'],
      name: data['name'],
    );
  }
}
