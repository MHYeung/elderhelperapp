import 'package:get/get.dart';
import 'package:helper/models/notification_models.dart';
import 'package:helper/services/storage/storage_repository.dart';

class NotificationController extends GetxController {
  NotificationRepository notificationRepository;

  NotificationController({required this.notificationRepository});

  final notifications = <AppNotification>[].obs;

  @override
  void onInit() {
    super.onInit();
    notifications.assignAll(notificationRepository.readNotifications());
    ever(notifications, (_) => notificationRepository.writeNotifications(notifications));
  }

  void fetchNotificationList() async {
    //fetch notification service from firebase later
  }

  Future<void> refreshNotification() async{
    notifications.refresh();
  }

  void removeNotification(String id) async {
    final deleteIndex = notifications.indexWhere((e) => e.id == id);
    notifications.removeAt(deleteIndex);
  }

  //testing getStorageUse;
  void addDummyNotification() async {

    final newNotification = AppNotification(
        id: DateTime.now().toString(),
        title: 'Dummy Notification',
        content: '',
        noteTime: DateTime.now());
    notifications.insert(0, newNotification);
  }

  String timeDifference(DateTime noteTime){
    final now = DateTime.now();
    final diff = now.difference(noteTime);
    if(diff.inDays >= 1) {
      return '${diff.inDays}d';
    }else if(diff.inHours >=1) {
      return '${diff.inHours}h';
    }
    else if(diff.inMinutes >=1) {
      return '${diff.inMinutes}m';
    }
    else if(diff.inSeconds >=10) {
      return '${diff.inSeconds}s';
    }
    else{
      return 'Just Now';
    }
  }
}
