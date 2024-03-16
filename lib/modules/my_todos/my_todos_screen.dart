import 'package:assignment/modules/my_todos/my_todos_controller.dart';
import 'package:assignment/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTodosScreen extends StatefulWidget {
  const MyTodosScreen({super.key});

  @override
  State<MyTodosScreen> createState() => _MyTodosScreenState();
}

class _MyTodosScreenState extends State<MyTodosScreen> {
  @override
  Widget build(BuildContext context) {
    final MyTodosController myTodoController = Get.put(MyTodosController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.all(AppUtils.normalPadding),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: myTodoController.titleController,
                        decoration: const InputDecoration(labelText: 'TODO Title'),
                      ),
                      const SizedBox(height: AppUtils.normalPadding * 3),
                      ElevatedButton(
                        onPressed: myTodoController.submitTodo,
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppUtils.normalPadding),
        child: Obx(
          () => myTodoController.isFetchingTodos
              ? const Center(child: CircularProgressIndicator())
              : myTodoController.todos.isEmpty
                  ? const Center(child: Text('No Todos found'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: myTodoController.todos.length,
                      itemBuilder: (context, index) {
                        final todo = myTodoController.todos[index];

                        return Card(
                          child: ListTile(
                            title: Text(
                              todo['title'],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Checkbox(
                              value: todo['isComplete'],
                              onChanged: (value) {
                                myTodoController.toggleTodoComplete(index);
                                setState(() {});
                              },
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
