import 'package:flutter/material.dart';

import '../screen/expenses.dart';

var kcolortheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 159),
);
var kcolordark = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kcolordark,
        cardTheme: const CardTheme().copyWith(
          color: kcolortheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true).copyWith(
        colorScheme: kcolortheme,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 96, 59, 159),
          foregroundColor: kcolortheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kcolortheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kcolortheme.primaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
      ),
      home: Expenses(),
    );
  }
}
