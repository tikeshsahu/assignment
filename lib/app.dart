import 'package:assignment/routes/app_pages.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      initialRoute: AppRoutes.layoutRoute,
      getPages: AppPages.pages,
    );
  }
}
