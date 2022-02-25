import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/pages/notification_overview/notification_controller.dart';

import '../../routes/app_pages.dart';

class GlobalAppBar extends StatelessWidget with PreferredSizeWidget {
  GlobalAppBar({Key? key, required this.title, this.actionWidget})
      : super(key: key);

  final String title;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: actionWidget ?? Text(title),
      actions: [
        IconButton(
            onPressed: () => Get.toNamed(Routes.SETTING),
            icon: const Icon(Icons.settings)),
        Badge(
          badgeContent: Center(child: GetX<NotificationController>(builder: (c) => Text('${c.notifications.length}', style: const TextStyle(color: Colors.white),))),
          position: BadgePosition.topEnd(top: 0, end: 2),
          animationType: BadgeAnimationType.scale,
          stackFit: StackFit.loose,
          child: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => Get.toNamed(Routes.NOTIFICATION_OVERVIEW),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
