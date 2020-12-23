import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() => setState(() {});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Colors AI')),
      body: const Center(),
      floatingActionButton:
          FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Generate', child: const Icon(Icons.add)));
}
