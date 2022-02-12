import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/controller/paginationcontroller.dart';

class Screen extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.data.value.length,
                  itemBuilder: (context, index) {
                    ///20 data ///EVENT
                    ///pageIndex++  ==   listlength ˜/ 20; ??INDEX
                    ///API call
                    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    //   ///AFTER WIDGET BUILD
                    // });
                    final data = controller.data.value[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${data.title}"),
                          Text("${data.description}"),
                          Text("${data.entityId}"),
                          Text("${data.referenceCount}"),
                          Text("${data.isTrusted}"),
                          Text("${data.thumbnailUrl}"),
                          Text("${data.type}"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
