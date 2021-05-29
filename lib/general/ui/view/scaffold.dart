import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../about/blocs/about_dialog/about_bloc.dart';
import '../../../about/ui/view/about_dialog.dart';
import '../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../color_generator/blocs/colors_locked/locked_bloc.dart';
import '../../../color_picker/blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../favorites/ui/widgets/buttons/save_colors_fab.dart';
import '../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../navigation/ui/constants.dart';
import '../../../navigation/ui/widgets/navigation_bar.dart';
import '../../../share/blocs/share/share_hydrated_bloc.dart';
import '../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../blocs/snackbars/snackbars_bloc.dart';
import '../../repository/colors_repository.dart';
import '../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<MainScreen> {
  final SoundBloc _soundBloc = SoundBloc();

  @override
  void initState() {
    _soundBloc.add(const SoundStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SoundBloc>(create: (_) => _soundBloc),
          BlocProvider<LockedBloc>(
              create: (_) => LockedBloc(context.read<ColorsRepository>())..add(const LockStarted())),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (_, navState) {
            if (navState.tabIndex != const NavigationGenerateTabInitial().tabIndex) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Scaffold(
              floatingActionButton: const SaveColorsFAB(),
              appBar: AppBar(
                  title: Text(navState.currentTabName, style: const TextStyle(fontWeight: FontWeight.w400)),
                  actions: [
                    appBarActions[navState.tabIndex],
                    BlocProvider(create: (context) => AboutBloc(), child: const AboutButton())
                  ]),
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<ColorsBloc>(
                      create: (_) => ColorsBloc(context.read<ColorsRepository>())..add(const ColorsStarted())),
                  BlocProvider<ShareBloc>(create: (_) => ShareBloc()..add(const ShareStarted())),
                  BlocProvider<ColorPickerBLoc>(create: (_) => ColorPickerBLoc()),
                  BlocProvider<SnackbarBloc>(create: (_) => SnackbarBloc()..add(const ServerStatusCheckedSuccess())),
                ],
                child: BlocListener<SnackbarBloc, SnackbarState>(
                  listener: (context, snackbarState) {
                    BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                    if (snackbarState is! SnackbarsInitial) {
                      late String message;
                      if (snackbarState is UrlCopySuccess) {
                        message = 'Link copied!';
                      } else if (snackbarState is ColorCopySuccess) {
                        message = 'Color ${snackbarState.clipboard} copied!';
                      } else if (snackbarState is ServerStatusCheckSuccess) {
                        message = 'The server is updated at midnight PDT, so it may be unavailable for 30 sec.';
                      }
                      final bool isUrlCopied = snackbarState is UrlCopySuccess;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          content: Text(message),
                          behavior: isUrlCopied ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
                          action: isUrlCopied
                              ? SnackBarAction(
                                  textColor: Theme.of(context).scaffoldBackgroundColor,
                                  label: 'OPEN',
                                  onPressed: () => BlocProvider.of<SnackbarBloc>(context).add(const UrlOpenedSuccess()))
                              : null,
                        ),
                      );
                    } else if (snackbarState is ServerStatusCheckSuccess) {}
                  },
                  child: SafeArea(child: navTabs.elementAt(navState.tabIndex)),
                ),
              ),
              bottomNavigationBar: BottomNavBar(navState),
            );
          },
        ),
      );
}
