import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/global_widgets/global_appbar/global_appbar.dart';
import 'package:helper/pages/notification_overview/notification_controller.dart';
import 'package:helper/pages/notification_overview/widgets/notification_item.dart';

class NotificationOverviewScreen extends StatelessWidget {
  const NotificationOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<NotificationController>(
        builder: (c) => Scaffold(
              appBar: AppBar(
                title: const Text('Notifications'),
                actions: [
                  TextButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: const Text('Clear All Notifications'),
                                  content: const Text(
                                      'Are you sure to clear all the notifications?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back(result: true);
                                          c.notifications.clear();
                                        },
                                        child: const Text('Confirm')),
                                    TextButton(
                                        onPressed: () =>
                                            Get.back(result: false),
                                        child: const Text('Cancel')),
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Clear All',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              body: RefreshIndicator(
                onRefresh: c.refreshNotification,
                child: c.notifications.isEmpty
                    ? const Center(
                        child: Text('No Notification now'),
                      )
                    : ListView.builder(
                        itemCount: c.notifications.length,
                        itemBuilder: (ctx, i) => NotificationItem(
                              note: c.notifications[i],
                            )),
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: c.addDummyNotification,
              ),
            ));
  }
}
