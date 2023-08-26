import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:flutter_solidart_testapp/todo/controllers/controller.dart';
import 'package:flutter_solidart_testapp/todo/models/todo.dart';
import 'package:flutter_solidart_testapp/todo/widgets/todos_body.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        SolidProvider<TodosController>(
          create: () => TodosController(initialTodos: Todo.sample),
          dispose: (controller) => controller.dispose(),
        ),
      ],
      child: const TodosPageView(),
    );
  }
}

class TodosPageView extends StatelessWidget {
  const TodosPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TodosBody(),
      ),
    );
  }
}
