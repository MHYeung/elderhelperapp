import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/models/notification_models.dart';
import 'package:helper/pages/notification_overview/notification_controller.dart';

class NotificationItem extends StatelessWidget {

  NotificationItem({Key? key, required this.note}) : super(key: key);

  final AppNotification note;
  final logic = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(note.id),
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content ?? ''),
        trailing: Text(logic.timeDifference(note.noteTime)),
      ),
      onDismissed: (direction){
        logic.removeNotification(note.id);
        Get.showSnackbar(GetSnackBar(
          message: 'Notification ${note.id} removed.',
          duration: const Duration(seconds: 3),
        ));
      },
    );
  }
}
