import 'package:assignment/modules/layout/layout_controller.dart';
import 'package:assignment/modules/layout/widgets/nav_bar_widget.dart';
import 'package:assignment/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutController = Get.put(LayoutController());

    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: AppUtils.normalPadding),
              Expanded(
                flex: 1,
                child: CustomizedNavBarWidget(
                  title: "HOME",
                  icon: layoutController.currentIndex == 0 ? Icons.home : Icons.home_outlined,
                  index: 0,
                ),
              ),
              const SizedBox(width: AppUtils.normalPadding * 1.5),
              Expanded(flex: 1, child: CustomizedNavBarWidget(title: "My Todos", icon: layoutController.currentIndex == 1 ? Icons.search : Icons.search_outlined, index: 1)),
              const SizedBox(width: AppUtils.normalPadding * 1.5),
              Expanded(flex: 1, child: CustomizedNavBarWidget(title: "Animals", icon: layoutController.currentIndex == 2 ? Icons.person : Icons.person_outlined, index: 2)),
              const SizedBox(width: AppUtils.normalPadding),
            ],
          ),
        ),
      ),
      body: Obx(
        () => layoutController.bodyPages[layoutController.currentIndex],
      ),
    );
  }
}
