import 'package:asroo_app/core/utiles/constant.dart';
import 'package:asroo_app/features/admin/notification/data/hive/notificationModel.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'getallnotifications_state.dart';

class GetallnotificationsCubit extends Cubit<GetallnotificationsState> {
  GetallnotificationsCubit() : super(GetallnotificationsInitial());
  getAllNotifications() async {
    emit(GetallnotificationsLoading());
    try {
      Box<NotificationModel> notificationBox =
          await Hive.box(Constans.hivenotification);
      List<NotificationModel> notifications =
          await notificationBox.values.toList();
      if (notifications.isEmpty) {
        emit(GetallnotificationsEmpty());
      } else {
        emit(GetallnotificationsSuccess(data: notifications));
      }
    } catch (e) {
      emit(GetallnotificationsFailure(error: e.toString()));
    }
  }
}
