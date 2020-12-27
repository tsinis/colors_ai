import 'package:flutter/material.dart';

import 'services/api/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(theme: ThemeData(primarySwatch: Colors.grey, brightness: Brightness.dark), home: const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _incrementCounter() async => await API.postRequest();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Colors AI')),
      body: const Center(),
      floatingActionButton:
          FloatingActionButton(onPressed: _incrementCounter, tooltip: 'Generate', child: const Icon(Icons.refresh)));
}
