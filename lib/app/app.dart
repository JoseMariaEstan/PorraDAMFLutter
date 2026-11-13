import 'package:flutter/material.dart';

import 'porra_app.dart';
import 'theme.dart';

/// Equivale a MainActivity + Porra_damTheme de la versión Kotlin.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Porra DAM',
      debugShowCheckedModeBanner: false,
      theme: temaPorra(Brightness.light),
      darkTheme: temaPorra(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const PorraApp(),
    );
  }
}
