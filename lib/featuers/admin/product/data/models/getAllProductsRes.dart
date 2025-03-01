class Getallproductsres {
  final String id;
  final String title;
  final int price;
  final String description;
  final List<dynamic> images;
  final GetallproductCategories categories;

  Getallproductsres(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.categories});
  factory Getallproductsres.fromJson(data) {
    return Getallproductsres(
      id: data['id'],
      title: data['title'],
      price: data['price'],
      description: data['description'],
      images: data['images'] == null
          ? 'https://s3-cdn.cmlabs.co/page/2023/01/24/a-guideline-on-how-to-fix-error-404-not-found-effectively-519451.png'
          : data['images'],
      categories: GetallproductCategories.fromJson(data['category']),
    );
  }
}

class GetallproductCategories {
  final String id;
  final String name;
  final String image;

  GetallproductCategories(
      {required this.id, required this.name, required this.image});
  factory GetallproductCategories.fromJson(data) {
    return GetallproductCategories(
      id: data['id'],
      name: data['name'] == null ? 'Not found' : data['name'],
      image: data['image'] == null
          ? 'https://s3-cdn.cmlabs.co/page/2023/01/24/a-guideline-on-how-to-fix-error-404-not-found-effectively-519451.png'
          : data['image'],
    );
  }
}
