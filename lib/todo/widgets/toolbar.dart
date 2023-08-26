import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:flutter_solidart_testapp/todo/models/todo.dart';

import '../controllers/controller.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({super.key});

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  late final todosController = context.get<TodosController>();

  late final allTodosCount =
      createComputed(() => todosController.todos().length);
  late final incompleteTodosCount =
      createComputed(() => todosController.incompleteTodos().length);
  late final completedTodosCount =
      createComputed(() => todosController.completedTodos().length);

  @override
  void dispose() {
    allTodosCount.dispose();
    incompleteTodosCount.dispose();
    completedTodosCount.dispose();
    super.dispose();
  }

  ReadSignal<int> mapFilterToTodosList(TodosFilter filter) {
    switch (filter) {
      case TodosFilter.all:
        return allTodosCount;
      case TodosFilter.incomplete:
        return incompleteTodosCount;
      case TodosFilter.completed:
        return completedTodosCount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TodosFilter.values.length,
      initialIndex: 0,
      child: TabBar(
        labelColor: Colors.black,
        tabs: TodosFilter.values.map(
          (filter) {
            final todosCount = mapFilterToTodosList(filter);
            return SignalBuilder(
              signal: todosCount,
              builder: (context, todosCount, _) {
                return Tab(text: '${filter.name} ($todosCount)');
              },
            );
          },
        ).toList(),
        onTap: (index) {
          context.update<TodosFilter>((_) => TodosFilter.values[index]);
        },
      ),
    );
  }
}
