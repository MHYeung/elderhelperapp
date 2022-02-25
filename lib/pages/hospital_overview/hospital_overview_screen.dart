import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/global_widgets/global_appbar/global_appbar.dart';
import 'package:helper/pages/hospital_overview/hospital_controller.dart';

import '../../routes/app_pages.dart';

class HospitalOverviewPage extends StatelessWidget {
  final logic = Get.put(HospitalController());

  HospitalOverviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalAppBar(
          title: 'Hospital Overview',
        ),
        body: RefreshIndicator(
          onRefresh: logic.fetchHospitalData,
          child: Center(
            child: FutureBuilder(
                future: logic.fetchHospitalData(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: logic.hospitalList.length,
                        itemBuilder: (ctx, i) {
                          return ListTile(
                            onTap: () =>
                                logic.goToDetail(logic.hospitalList[i].name),
                            title: Text(logic.hospitalList[i].name),
                            subtitle: Text(logic.hospitalList[i].waitingTime),
                          );
                        });
                  }
                }),
          ),
        ));
  }
}
