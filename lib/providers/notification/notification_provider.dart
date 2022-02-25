import 'dart:convert';

import 'package:get/get.dart';
import 'package:helper/configs/keys.dart';
import 'package:helper/models/notification_models.dart';
import 'package:helper/services/storage/storage_services.dart';

class NotificationProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<AppNotification> readNotifications() {
    var notifications = <AppNotification>[];
    jsonDecode(_storage.read(notificationKey).toString())
        .forEach((noti) => notifications.add(AppNotification.fromJson(noti)));
    return notifications;
  }

  void writeNotification(List<AppNotification> notifications) {
    _storage.write(notificationKey, jsonEncode(notifications));
  }
}
