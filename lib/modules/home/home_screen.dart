import 'package:assignment/modules/home/home_controller.dart';
import 'package:assignment/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => homeController.pagingController.refresh(),
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.all(AppUtils.normalPadding / 2),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                  child: const Text(
                    "Note: You need to enter complete title of Todos, in order to search (Api issue).",
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: AppUtils.normalPadding / 2,
                ),
                Obx(
                  () => SizedBox(
                    height: size.height * 0.06,
                    width: size.width,
                    child: TextField(
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        decoration: AppUtils.textFieldDecoration().copyWith(
                          hintText: "Search Todos",
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            size: 22,
                          ),
                          suffixIcon: homeController.searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    homeController.searchController.clear();
                                    homeController.pagingController.refresh();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: const Icon(
                                    Icons.clear_outlined,
                                    color: Colors.black,
                                  ),
                                )
                              : const Offstage(),
                        ),
                        controller: homeController.searchController,
                        onChanged: (value) {
                          homeController.searchDebounce(value);
                        }),
                  ),
                ),
                const SizedBox(
                  height: AppUtils.normalPadding / 2,
                ),
                SizedBox(
                  height: size.height * 0.91,
                  child: PagedListView.separated(
                    shrinkWrap: true,
                    pagingController: homeController.pagingController,
                    builderDelegate: PagedChildBuilderDelegate(noItemsFoundIndicatorBuilder: (context) {
                      return SizedBox(
                        width: size.width,
                        height: size.height * 0.50,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: "No Data Found",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }, itemBuilder: (context, dynamic item, index) {
                      return Card(
                        elevation: 4,
                        surfaceTintColor: Colors.white,
                        child: ListTile(
                          leading: Text(
                            "${index + 1}.",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          title: Text(
                            item['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: AppUtils.normalPadding / 2,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
