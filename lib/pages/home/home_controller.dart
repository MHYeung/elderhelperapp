import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  void goToHospitalOverview() {
    Get.toNamed(Routes.HOSPITAL_OVERVIEW);
  }

  void goToAudioPlayer() {
    Get.toNamed(Routes.AUDIO_PLAYER);
  }
}
