import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyTodosController extends GetxController {
  final Rx _titleController = Rx(TextEditingController());
  final storage = GetStorage();
  final RxList _todos = RxList([]);
  final RxBool _isFetchingTodos = RxBool(false);

  TextEditingController get titleController => _titleController.value;
  List get todos => _todos;
  bool get isFetchingTodos => _isFetchingTodos.value;

  @override
  void onInit() {
    super.onInit();
    if (storage.read('todos') != null) {
      _todos.assignAll(storage.read('todos'));
    }
  }

  @override
  void dispose() {
    _titleController.value.dispose();
    super.dispose();
  }

  updateIsFetchingTodos(bool value) {
    _isFetchingTodos.value = value;
    update();
  }

  void submitTodo() {
    final title = titleController.text;
    if (title.isNotEmpty) {
      saveTodo(title);
      titleController.clear();
      Get.back();
    }
  }

  void saveTodo(String title) {
    _todos.add({'title': title, 'isComplete': false});
    storage.write('todos', _todos);
  }

  void toggleTodoComplete(int index) {
    _todos[index]['isComplete'] = !_todos[index]['isComplete'];
    storage.write('todos', _todos);
    update();
  }
}
