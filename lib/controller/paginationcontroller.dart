import 'dart:developer';

import 'package:get/get.dart';
import 'package:pagination/modal/paginationmodal.dart';
import 'package:pagination/service/service.dart';

class Controller extends GetxController {
  Rx<Pagination> paginaton = Pagination().obs;

  @override
  void onInit() {
    fatchData();
    super.onInit();
  }

  void fatchData() async {
    try {
      final data = await ApiService.fatchPostData();
      if (data != null) {
        paginaton.value = data;
      }
    } catch (e, st) {
      log('fatchData:---->> 000->>$e && st is:-->>$st');
    }
  }
}
