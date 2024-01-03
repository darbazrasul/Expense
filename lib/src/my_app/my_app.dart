import 'package:flutter/material.dart';

import '../screen/expenses.dart';

var kcolortheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 159),
);

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kcolortheme.primaryContainer,
                fontSize: 14,
              ))),
      home: Expenses(),
    );
  }
}
