import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/colors_bloc.dart';
import 'bloc/colors_event.dart';
import 'repositories/colors_repository.dart';
import 'widgets/colors_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) =>
      MaterialApp(theme: ThemeData(primarySwatch: Colors.grey, brightness: Brightness.dark), home: const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  static const ColorsRepository _colorsRepository = ColorsRepository();
  @override
  Widget build(BuildContext context) => BlocProvider<ColorsBloc>(
        create: (context) => ColorsBloc(_colorsRepository),
        child: Scaffold(
          appBar: AppBar(title: const Text('Colors AI')),
          floatingActionButton: const GenButton(),
          body: ColorsAIList(),
        ),
      );
}

class GenButton extends StatelessWidget {
  const GenButton();

  @override
  Widget build(BuildContext context) => FloatingActionButton(
      onPressed: () => BlocProvider.of<ColorsBloc>(context).add(ColorsGenEvent()),
      tooltip: 'Generate',
      child: const Icon(Icons.refresh));
}
