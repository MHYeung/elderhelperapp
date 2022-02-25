import 'package:get/get.dart';
import 'package:helper/pages/audio_player/audio_controller.dart';

class AudioBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AudioController());
  }
}