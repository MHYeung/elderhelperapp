import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helper/models/hospital_models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../routes/app_pages.dart';

class HospitalController extends GetxController {
  bool isLoading = true;

  List<Hospital> _hospitalList = [];

  List<Hospital> get hospitalList => _hospitalList;

  @override
  onInit() {
    fetchHospitalData();
    super.onInit();
  }

  Future<void> fetchHospitalData() async {
    const url = 'https://www.ha.org.hk/opendata/aed/aedwtdata-en.json';
    try {
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);
      final waitData = data['waitTime'] as List;
      final updateTime = data['updateTime'];
      final List<Hospital> loadedList = [];
      for (var element in waitData) {
        loadedList.add(Hospital(
            name: element['hospName'], waitingTime: element['topWait']));
      }
      _hospitalList = loadedList;
      isLoading = false;
      update();
      Get.showSnackbar(GetSnackBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
        message: 'Last Updated at: $updateTime',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      ));
    } catch (error) {
      rethrow;
    }
  }

  void goToDetail(String name) {
    Get.toNamed(Routes.HOSPITAL_DETAIL, arguments: name);
  }
}
