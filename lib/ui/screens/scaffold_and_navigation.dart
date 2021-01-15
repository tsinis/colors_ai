import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/fab_bloc/fab_bloc.dart';
import '../../repositories/colors_repository.dart';
import '../widgets/buttons/save_colors_fab.dart';
import 'gen_colors_tab.dart';
import 'saved_colors_tab.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with TickerProviderStateMixin {
  late Animation<double> fabAnimation;
  int _currentIndex = 1;

  late final AnimationController fabController;

  @override
  void dispose() {
    fabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print('fired');
    super.initState();
    fabController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..reverse();
    fabAnimation = CurvedAnimation(parent: fabController, curve: Curves.easeIn);
  }

  List<Widget> get screens => <Widget>[
        const ColoredBox(color: Colors.orange),
        BlocProvider<LockedBloc>(
            create: (_) => LockedBloc(context.read<ColorsRepository>()), child: const ColorsGenerator()),
        const SavedColorsList(),
      ];

  void _switchScreen(int newTabIndex) {
    //TODO! FIXIT: Handle it in NavigationBloc.
    (newTabIndex == 1) ? fabController.forward() : fabController.reverse();
    setState(() => _currentIndex = newTabIndex);
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<FabBloc>(create: (_) => FabBloc()),
          BlocProvider<SavedBloc>(create: (_) => SavedBloc()),
        ],
        child: Scaffold(
          floatingActionButton: ScaleTransition(scale: fabAnimation, child: SaveColorsFAB(controller: fabController)),
          appBar: AppBar(title: const Text('Saved colors', style: TextStyle(fontWeight: FontWeight.w300))),
          body: BlocProvider<ColorsBloc>(
              create: (_) => ColorsBloc(context.read<ColorsRepository>()),
              child: SafeArea(child: screens.elementAt(_currentIndex))),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _switchScreen,
            items: const [
              BottomNavigationBarItem(label: 'Share', icon: Icon(Icons.share_outlined)),
              BottomNavigationBarItem(label: 'Generate', icon: Icon(Icons.palette_outlined)),
              BottomNavigationBarItem(label: 'Saved', icon: Icon(Icons.bookmark_border_outlined)),
            ],
          ),
        ),
      );
}
