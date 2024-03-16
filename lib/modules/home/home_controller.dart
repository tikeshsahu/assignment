import 'package:assignment/services/api_services.dart/api.dart';
import 'package:assignment/utils/custom_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  final int limit = 50;

  final Rx _pagingController = Rx(PagingController(firstPageKey: 1));

  final RxBool _isFetchingTodos = RxBool(false);

  final RxList _todosData = RxList([]);

  final Rx _searchController = Rx(TextEditingController());

  TextEditingController get searchController => _searchController.value;

  List get todosData => _todosData;

  bool get isFetchingTodos => _isFetchingTodos.value;

  PagingController get pagingController => _pagingController.value;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      fetchTodos(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    searchController.dispose();
    super.dispose();
  }

  updateIsFetchingTodos(bool value) {
    _isFetchingTodos.value = value;
    update();
  }

  fetchTodos(int pageKey, {String query = ""}) async {
    try {
      final response = await Api.instance.getTodos(
        page: pageKey,
        limit: limit,
        query: query,
      );

      final isLastPage = response.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(response);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(response, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  

  onSearch(String value) async {
    if (value == "") {
      pagingController.refresh();
      return;
    }
    pagingController.itemList?.clear();
    await fetchTodos(
      1,
      query: value,
    );
  }

  searchDebounce(String value) {
    final debounce = CustomDebounce(milliseconds: 300);
    debounce.run(() {
      onSearch(value);
    });
  }
}
