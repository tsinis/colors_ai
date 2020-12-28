import 'package:flutter/material.dart';

import './extensions/colors_rgb.dart';
import 'repositories/data_repository.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();
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
  final DataRepository _data = DataRepository();

  @override
  void initState() {
    _data.getAllColors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Colors AI')),
        floatingActionButton: FloatingActionButton(
            onPressed: () => _data.getAllColors.whenComplete(() => setState(() {})),
            tooltip: 'Generate',
            child: const Icon(Icons.refresh)),
        body: Row(children: buildColorsList()),
      );

  List<Widget> buildColorsList() =>
      List.generate(_data.colorsList.length, (i) => Flexible(child: Container(color: _data.colorsList[i].toColor())),
          growable: false);
}
