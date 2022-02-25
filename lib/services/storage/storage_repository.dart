import 'package:helper/models/notification_models.dart';
import 'package:helper/providers/notification/notification_provider.dart';

class NotificationRepository{
  NotificationProvider notificationProvider;

  NotificationRepository({required this.notificationProvider});

  List<AppNotification> readNotifications() => notificationProvider.readNotifications();

  void writeNotifications(List<AppNotification> notifications) => notificationProvider.writeNotification(notifications);

}