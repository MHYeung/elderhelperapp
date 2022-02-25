import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../configs/keys.dart';

class ThemeController extends GetxController{

  final _box = GetStorage('theme');
  final _key = themeKey;

  bool get isDark => _box.read(_key) ?? false;

  saveTheme(bool value){
    _box.write(_key, value);
    update();
  }
}