import 'package:get/get.dart';
import 'package:helper/pages/notification_overview/notification_controller.dart';
import 'package:helper/providers/notification/notification_provider.dart';
import 'package:helper/services/storage/storage_repository.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(
        notificationRepository: NotificationRepository(
            notificationProvider: NotificationProvider())));
  }
}
