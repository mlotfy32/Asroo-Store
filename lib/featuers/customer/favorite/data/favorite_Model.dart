import 'package:hive/hive.dart';
part 'favorite_Model.g.dart';

@HiveType(typeId: 2)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String image;

  @HiveField(3)
  String price;

  @HiveField(4)
  String name;
  FavoriteModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.title});
}
