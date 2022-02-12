import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/modal/paginationmodal.dart';
import 'package:pagination/service/service.dart';

class Controller extends GetxController {
  Rx<Pagination> paginaton = Pagination().obs;
  ScrollController scrollController = ScrollController();
  RxList data = [].obs;
  RxBool loding = true.obs;
  int pageLimit = 25;
  int select = 0;

  @override
  void onInit() {
    fatchData(0);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("pixel ==>>${scrollController.position.pixels}");
        nextData();
      }
    });
    super.onInit();
  }

  void fatchData(int select) async {
    try {
      loding(true);
      final result = await ApiService.fatchPostData(0);
      paginaton.value = result!;
      if (paginaton.value.items!.isNotEmpty) {
        data.addAll(paginaton.value.items!);
        print("data==>>>>${data.length}");
        select++;
      }
    } catch (e, st) {
      loding(false);
      log('fatchData:---->> 000->>$e && st is:-->>$st');
    }
  }

  nextData() async {
    try {
      loding.value = true;
      if (paginaton.value.items!.length > pageLimit) {
        loding(false);
      } else {
        select++;
      }
      final result = await ApiService.fatchPostData(select);
      paginaton.value = result!;
      if (paginaton.value.items!.isNotEmpty) {
        data.addAll(paginaton.value.items!);
      }
    } catch (e) {
      loding(false);
      print(e);
    }
  }
}
