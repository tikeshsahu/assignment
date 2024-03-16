import 'package:assignment/modules/animals/animal_details/animal_details_binding.dart';
import 'package:assignment/modules/animals/animal_details/animal_details_screen.dart';
import 'package:assignment/modules/animals/animals_binding.dart';
import 'package:assignment/modules/animals/animals_screen.dart';
import 'package:assignment/modules/home/home_binding.dart';
import 'package:assignment/modules/home/home_screen.dart';
import 'package:assignment/modules/layout/layout_binding.dart';
import 'package:assignment/modules/layout/layout_screen.dart';
import 'package:assignment/modules/my_todos/my_todos_binding.dart';
import 'package:assignment/modules/my_todos/my_todos_screen.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.myTodosRoute, page: () => const MyTodosScreen(), binding: MyTodosBinding()),
    GetPage(name: AppRoutes.homeRoute, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(name: AppRoutes.animalsRoute, page: () => const AnimalsScreen(), binding: AnimalsBinding()),
    GetPage(name: AppRoutes.animalDetailsRoute, page: () => const AnimalDetailsScreen(), binding: AnimalDetailsBinding()),
    GetPage(name: AppRoutes.layoutRoute, page: () => const LayoutScreen(), bindings: [
      LayoutBinding(),
      MyTodosBinding(),
      AnimalsBinding(),
    ]),
  ];
}
