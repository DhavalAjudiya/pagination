import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/modal/paginationmodal.dart';
import 'package:pagination/service/service.dart';

class Controller extends GetxController {
  Rx<Pagination> paginaton = Pagination().obs;
  ScrollController scrollController = ScrollController();
  RxList data = [].obs;
  int select = 0;
  RxBool isPagination = false.obs;

  @override
  void onInit() {
    fatchData(0);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("pixel ==>>${scrollController.position.pixels}");
        isPagination.value = true;
        nextData();
      }
    });
    super.onInit();
  }

  void fatchData(int select) async {
    try {
      final result = await ApiService.fatchPostData(0);
      paginaton.value = result!;
      if (paginaton.value.items!.isNotEmpty) {
        data.addAll(paginaton.value.items!);
        print("data==>>>>${data.length}");
      }
    } catch (e, st) {
      log('fatchData:---->> 000->>$e && st is:-->>$st');
    }
  }

  void nextData() async {
    try {
      select++;
      print("select---------->>>${select}");
      final result = await ApiService.fatchPostData(select);
      paginaton.value = result!;
      if (paginaton.value.items != null) {
        data.addAll(paginaton.value.items!);
        print("adddata====///>>>>${data.length}");
      }
    } catch (e, st) {
      print("nextdata ======---->>>>>>${e}////${st}");
    } finally {
      //
    }
  }
}
