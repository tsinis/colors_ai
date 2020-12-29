import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../repositories/colors_repository.dart';
import '../../ui/widgets/colors_list.dart';
import '../../ui/widgets/generate_button.dart';
import '../widgets/app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen();

  static const ColorsRepository _colorsRepository = ColorsRepository();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<ColorsBloc>(create: (context) => ColorsBloc(_colorsRepository)),
        BlocProvider<SavedBloc>(create: (context) => SavedBloc()),
      ], child: const AppScafold());
}

class AppScafold extends StatefulWidget {
  const AppScafold();

  @override
  _AppScafoldState createState() => _AppScafoldState();
}

class _AppScafoldState extends State<AppScafold> with SingleTickerProviderStateMixin {
  static const double _appBarHeight = 86;
  late TabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(preferredSize: const Size.fromHeight(_appBarHeight), child: CustomAppBar(_controller)),
        floatingActionButton: const GenButton(),
        body: TabBarView(
            controller: _controller,
            children: const [ColorsAIList(appBarHeight: _appBarHeight), ColoredBox(color: Colors.grey)]),
      );
}
