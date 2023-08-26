import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class MyToggleApp extends StatelessWidget {
  const MyToggleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        SolidSignal<Signal<ThemeMode>>(
          create: () => createSignal(ThemeMode.light),
        ),
      ],
      builder: (context) {
        final themeMode = context.observe<ThemeMode>();
        return MaterialApp(
          title: 'Toggle theme',
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const Togglepage(),
        );
      },
    );
  }
}

class Togglepage extends StatelessWidget {
  const Togglepage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.get<Signal<ThemeMode>>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle theme'),
      ),
      body: Center(
        child: SignalBuilder(
          signal: themeMode,
          builder: (_, mode, __) {
            return IconButton(
              onPressed: () {
                if (mode == ThemeMode.light) {
                  themeMode.value = ThemeMode.dark;
                } else {
                  themeMode.value = ThemeMode.light;
                }
              },
              icon: Icon(
                mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
              ),
            );
          },
        ),
      ),
    );
  }
}
