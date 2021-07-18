import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
import '../../../navigation/ui/widgets/navigation_rail.dart';
import '../../../share/blocs/share/share_hydrated_bloc.dart';
import '../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../blocs/snackbars/snackbars_bloc.dart';
import '../../repository/colors_repository.dart';
import '../constants.dart';
import '../widgets/app_bar_info_title.dart';

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<MainScreen> {
  final SoundBloc soundBloc = SoundBloc();

  @override
  void initState() {
    soundBloc.add(const SoundStarted());
    super.initState();
  }

  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SoundBloc>(create: (_) => soundBloc),
          BlocProvider<LockedBloc>(
              create: (_) => LockedBloc(context.read<ColorsRepository>())..add(const LockStarted())),
          BlocProvider<ColorsBloc>(
            create: (_) => ColorsBloc(context.read<ColorsRepository>())..add(const ColorsStarted()),
          ),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (_, navState) {
            if (navState.tabIndex != const NavigationGenerateTabInitial().tabIndex) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Scaffold(
              floatingActionButton: isPortrait ? const SaveColorsFAB() : null,
              appBar: AppBar(
                title: AppBarInfoTitle(selectedTabIndex: navState.tabIndex),
                actions: [
                  appBarActions[navState.tabIndex],
                  BlocProvider(
                    create: (_) =>
                        AboutBloc()..add(AboutStarted(currentLocale: AppLocalizations.of(context).localeName)),
                    child: const AboutButton(),
                  )
                ],
              ),
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<ColorPickerBLoc>(create: (_) => ColorPickerBLoc()),
                  BlocProvider<SnackbarBloc>(
                    create: (_) => SnackbarBloc()..add(const ServerStatusCheckedSuccess()),
                  ),
                  BlocProvider<ShareBloc>(
                    create: (_) => ShareBloc()..add(const ShareStarted()),
                  ),
                ],
                child: BlocListener<SnackbarBloc, SnackbarState>(
                  listener: (context, snackbarState) {
                    if (snackbarState is! SnackbarsInitial) {
                      BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                      late String message;
                      final bool isUrlCopied = snackbarState is UrlCopySuccess;
                      final bool isShareFailed = snackbarState is ShareAttemptFailure;
                      if (isUrlCopied) {
                        message = AppLocalizations.of(context).urlCopiedMessage;
                      } else if (snackbarState is ColorCopySuccess) {
                        message = AppLocalizations.of(context).colorCopiedMessage(snackbarState.clipboard);
                      } else if (snackbarState is ServerStatusCheckSuccess) {
                        message = AppLocalizations.of(context).serverMaintanceMessage;
                      } else if (isShareFailed) {
                        message = AppLocalizations.of(context).shareFailedMessage;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          content: Text(message),
                          behavior: (isUrlCopied || isShareFailed)
                              ? isPortrait
                                  ? SnackBarBehavior.fixed
                                  : SnackBarBehavior.floating
                              : SnackBarBehavior.floating,
                          action: isUrlCopied
                              ? SnackBarAction(
                                  textColor: Theme.of(context).scaffoldBackgroundColor,
                                  label: AppLocalizations.of(context).urlOpenButtonLabel.toUpperCase(),
                                  onPressed: () => BlocProvider.of<SnackbarBloc>(context).add(const UrlOpenedSuccess()))
                              : null,
                        ),
                      );
                    }
                  },
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isPortrait) NavRail(navState),
                        if (!isPortrait) const VerticalDivider(width: 1),
                        Expanded(
                          child: Builder(
                            builder: (BuildContext newContext) => RawKeyboardListener(
                                focusNode: FocusNode(),
                                includeSemantics: false,
                                autofocus: navState.tabIndex == 1,
                                onKey: (RawKeyEvent event) {
                                  if (event.isKeyPressed(LogicalKeyboardKey.space) &&
                                      navState.tabIndex == const NavigationGenerateTabInitial().tabIndex) {
                                    if (kIsWeb) {
                                      BlocProvider.of<SoundBloc>(newContext).add(const SoundRefreshed());
                                    }
                                    BlocProvider.of<ColorsBloc>(newContext).add(const ColorsGenerated());
                                    // BlocProvider.of<FabBloc>(newContext).add(const FabShowed());
                                  }
                                },
                                child: navTabs.elementAt(navState.tabIndex)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: isPortrait ? BottomNavBar(navState) : null,
            );
          },
        ),
      );
}
