import 'package:calculator/screen/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primaryColor: Colors.grey,
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          secondary: Colors.black87,
          primary: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          secondary: Colors.white,
          primary: Colors.white12,
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      home: CalCulator(toThemeChange: changeTheme),
    );
    ;
  }
}
