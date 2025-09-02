import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curatrail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Lato",
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w100, // Thin
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w200, // ExtraLight
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w300, // Light
          ),
          titleSmall: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w400, // Regular
          ),
          titleMedium: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w500, // Medium
          ),
          titleLarge: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w600, // SemiBold
          ),
          labelMedium: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w700, // Bold
          ),
          labelLarge: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w800, // ExtraBold
          ),
          displayLarge: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w900, // Black
          ),
        ),

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
