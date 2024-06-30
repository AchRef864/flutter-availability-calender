import 'package:flutter/material.dart';
import 'days.dart'; // Import the DaysSelector component

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
          primary: Colors.black,
          onPrimary: Colors.white,
          surface: Colors.black,
          onSurface: Colors.white,
          background: Colors.black,
          onBackground: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Select your availability'),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // Adjust the height as needed
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Padding(
            padding: const EdgeInsets.only(top: 30.0), // Adjust the top padding as needed
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: const DaysSelector(), // Using the DaysSelector component here
        ),
      ),
    );
  }
}
