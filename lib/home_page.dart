import 'package:flutter/material.dart';
import 'package:flutter_solidart_testapp/counter/counter.dart';
import 'package:flutter_solidart_testapp/todo/todos_page.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('solidart state management'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const CounterPage()));
              },
              child: const Text('Counter'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const TodosPage()));
              },
              child: const Text('Todos'),
            ),
          ],
        ),
      ),
    );
  }
}
