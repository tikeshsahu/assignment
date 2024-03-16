
import 'package:assignment/modules/animals/animals_screen.dart';
import 'package:assignment/modules/home/home_screen.dart';
import 'package:assignment/modules/my_todos/my_todos_screen.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final bodyPages = [const HomeScreen(), const MyTodosScreen(), const AnimalsScreen()];
  final RxInt _currentIndex = RxInt(0);

  // getter
  int get currentIndex => _currentIndex.value;

  changeIndex(int value) {
    _currentIndex.value = value;
    // if (value == 0) {
    //   Get.delete<ProfileController>();
    //   Get.delete<SearchPageController>();
    // } else if (value == 1) {
    //   Get.delete<HomeController>();
    //   Get.delete<ProfileController>();
    // } else {
    //   Get.delete<HomeController>();
    //   Get.delete<SearchPageController>();
    // }
    update();
  }
}
