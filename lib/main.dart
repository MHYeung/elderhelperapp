import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helper/pages/notification_overview/bindings.dart';
import 'package:helper/routes/app_pages.dart';
import 'package:helper/services/storage/storage_services.dart';
import 'package:helper/theme/theme.dart';
import 'package:helper/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
      DevicePreview(enabled: !kReleaseMode, builder: (context) => RootApp()));
}

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
      builder: (_) => GetMaterialApp(
        initialBinding: NotificationBinding(),
        getPages: AppPages.routes,
        initialRoute: Routes.HOME,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: themeController.isDark
            ? CustomThemes.darkTheme
            : CustomThemes.lightTheme,
        //darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}

Future<void> initServices() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  Get.lazyPut(() => ThemeController());
}
