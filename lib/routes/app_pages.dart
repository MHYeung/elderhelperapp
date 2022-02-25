import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/pages/audio_player/audio_binding.dart';
import 'package:helper/pages/audio_player/audio_player_screen.dart';
import 'package:helper/pages/home/home_binding.dart';
import 'package:helper/pages/home/home_screen.dart';
import 'package:helper/pages/notification_overview/bindings.dart';
import 'package:helper/pages/notification_overview/notification_overview_screen.dart';
import '../pages/hospital_detail/hospital_detail_screen.dart';
import '../pages/hospital_overview/hospital_overview_screen.dart';
import '../pages/setting/setting_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.HOSPITAL_OVERVIEW,
      page: () => HospitalOverviewPage(),
    ),
    GetPage(name: Routes.SETTING, page: () => SettingPage()),
    GetPage(
        name: Routes.HOSPITAL_DETAIL, page: () => const HospitalDetailPage()),
    GetPage(
        name: Routes.NOTIFICATION_OVERVIEW,
        page: () => const NotificationOverviewScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.AUDIO_PLAYER,
      page: () => AudioPlayerScreen(),
      binding: AudioBinding()
    )
  ];
}
