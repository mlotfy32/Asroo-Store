import 'package:hive/hive.dart';
part 'notificationModel.g.dart';

@HiveType(typeId: 0)
class NotificationModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String body;
  @HiveField(3)
  final DateTime createdDate;
  NotificationModel(
      {required this.id,
      required this.body,
      required this.title,
      required this.createdDate});
}
