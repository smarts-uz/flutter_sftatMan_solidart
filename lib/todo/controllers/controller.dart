import 'package:flutter/foundation.dart';
import 'package:flutter_solidart/flutter_solidart.dart';
import 'package:flutter_solidart_testapp/todo/models/todo.dart';

@immutable
class TodosController {
  TodosController({
    List<Todo> initialTodos = const [],
  }) : _todos = createSignal(initialTodos);

  final Signal<List<Todo>> _todos;
  late final todos = _todos.toReadSignal();

  late final completedTodos = createComputed(
    () => _todos().where((todo) => todo.completed).toList(),
  );

  late final incompleteTodos = createComputed(
    () => _todos().where((todo) => !todo.completed).toList(),
  );

  void add(Todo todo) {
    _todos.update((value) => [...value, todo]);
  }

  void remove(String id) {
    _todos.update(
      (value) => value.where((todo) => todo.id != id).toList(),
    );
  }

  void toggle(String id) {
    _todos.update(
      (value) => [
        for (final todo in value)
          if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
      ],
    );
  }

  void dispose() {
    todos.dispose();
    completedTodos.dispose();
    incompleteTodos.dispose();
  }
}
