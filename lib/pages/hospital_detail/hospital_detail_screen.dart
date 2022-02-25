import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/global_widgets/global_appbar/global_appbar.dart';
import 'package:helper/pages/hospital_overview/hospital_controller.dart';

class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HospitalController>();
    final hosp = logic.hospitalList.firstWhere((element) => element.name == Get.arguments);
    return Scaffold(
      appBar: GlobalAppBar(title: 'Hospital Detail',),
      body: Center(child: Column(
        children: [
          AutoSizeText(hosp.name),
          Text('Waiting Time: ${hosp.waitingTime}'),
        ],
      )),
    );
  }
}
