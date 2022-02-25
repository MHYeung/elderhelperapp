import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme_controller.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);


  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Text('DarkMode'),
                GetBuilder<ThemeController>(
                  builder: (_)=> Switch(
                    value: themeController.isDark,
                    onChanged: (val){
                      themeController.saveTheme(val);
                    },
                  ),
                )
              ],
            )
          ],
        ));
  }
}
