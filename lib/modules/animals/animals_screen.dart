import 'package:assignment/models/animals.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalsScreen extends StatelessWidget {
  const AnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppUtils.normalPadding),
          child: ListView.builder(
            itemCount: AppUtils.animalsData.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Animals animalData = AppUtils.animalsData[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.animalDetailsRoute, arguments: {"data": animalData});
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      animalData.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      animalData.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
