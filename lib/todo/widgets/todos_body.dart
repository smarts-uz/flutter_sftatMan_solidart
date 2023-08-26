import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:flutter_solidart_testapp/todo/controllers/controller.dart';
import 'package:flutter_solidart_testapp/todo/models/todo.dart';
import 'package:flutter_solidart_testapp/todo/widgets/todos_list.dart';
import 'package:flutter_solidart_testapp/todo/widgets/toolbar.dart';

class TodosBody extends StatefulWidget {
  const TodosBody({super.key});

  @override
  State<TodosBody> createState() => _TodosBodyState();
}

class _TodosBodyState extends State<TodosBody> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todosController = context.get<TodosController>();

    return Solid(
      providers: [
        SolidSignal<Signal<TodosFilter>>(
            create: () => createSignal(TodosFilter.all)),
      ],
      child: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: 'Write new todo',
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Cannot be empty';
              }
              return null;
            },
            onFieldSubmitted: (task) {
              if (task.isEmpty) return;
              final newTodo = Todo.create(task);
              todosController.add(newTodo);
              textController.clear();
            },
          ),
          const SizedBox(height: 16),
          const Toolbar(),
          const SizedBox(height: 16),
          Expanded(
            child: TodoList(
              onTodoToggle: (id) {
                todosController.toggle(id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
