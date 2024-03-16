

import 'package:assignment/modules/my_todos/my_todos_controller.dart';
import 'package:get/get.dart';

class MyTodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTodosController(), fenix: true);
  }
}