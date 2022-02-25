import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/global_widgets/global_appbar/global_appbar.dart';
import 'package:helper/pages/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final home = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: 'Home',),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: home.goToAudioPlayer, child: const Text('Audio Player')),
          TextButton(onPressed: home.goToHospitalOverview, child: const Text('Hospital Status')),
        ],
      ),
    );
  }
}
