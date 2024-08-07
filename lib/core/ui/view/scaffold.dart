import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../about/blocs/about_dialog/about_bloc.dart';
import '../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../color_generator/blocs/colors_locked/locked_bloc.dart';
import '../../../color_picker/blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../../common/blocs/snackbars/snackbars_bloc.dart';
import '../../../common/ui/widgets/app_bar_info_title.dart';
import '../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../favorites/ui/widgets/buttons/save_colors_fab.dart';
import '../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../navigation/ui/constants.dart';
import '../../../navigation/ui/widgets/bottom_navigation.dart';
import '../../../navigation/ui/widgets/navigation_rail.dart';
import '../../../settings/blocs/settings_hydrated_bloc.dart';
import '../../../share/blocs/share/share_hydrated_bloc.dart';
import '../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../repository/colors_repository.dart';
import '../constants.dart';
import '../widgets/overflow_menu.dart';

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
    // AppLocalizations are not avalible before initState method complete.
    Future.delayed(
        Duration.zero,
        () => BlocProvider.of<AboutBloc>(context)
            .add(AboutStarted(currentLocale: AppLocalizations.of(context).localeName)));
  }

  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  SystemUiOverlayStyle get overlayStyle =>
      Theme.of(context).brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

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
          builder: (navContext, navState) {
            final bool isGenTab = navState.tabIndex == const NavigationGenerateTabInitial().tabIndex;
            if (!isGenTab) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Shortcuts(
              shortcuts: <ShortcutActivator, Intent>{
                ...WidgetsApp.defaultShortcuts,
                const SingleActivator(spacebar): isGenTab ? DoNothingIntent() : const ActivateIntent(),
              },
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                includeSemantics: false,
                autofocus: true,
                onKey: (RawKeyEvent event) {
                  if (event.isKeyPressed(spacebar) && isGenTab) {
                    if (kIsWeb) {
                      BlocProvider.of<SoundBloc>(navContext).add(const SoundRefreshed());
                    }
                    BlocProvider.of<ColorsBloc>(navContext).add(ColorsGenerated(
                      generateColorsForUi: BlocProvider.of<SettingsBloc>(navContext).state.colorsForUi,
                    ));
                  }
                },
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: overlayStyle.copyWith(
                      systemNavigationBarColor: Theme.of(context).navigationRailTheme.backgroundColor),
                  child: Scaffold(
                    floatingActionButton: isPortrait ? const SaveColorsFAB() : null,
                    appBar: AppBar(
                      systemOverlayStyle: overlayStyle.copyWith(statusBarColor: Colors.transparent),
                      title: AppBarInfoTitle(selectedTabIndex: navState.tabIndex),
                      actions: [appBarActions[navState.tabIndex], const OverflowMenu()],
                    ),
                    body: MultiBlocProvider(
                      providers: [
                        BlocProvider<ColorPickerBLoc>(create: (_) => ColorPickerBLoc()),
                        BlocProvider<SnackbarBloc>(
                          create: (_) => SnackbarBloc()..add(const ServerStatusCheckedSuccess()),
                        ),
                        BlocProvider<ShareBloc>(lazy: false, create: (_) => ShareBloc()..add(const ShareStarted())),
                      ],
                      child: BlocListener<SnackbarBloc, SnackbarState>(
                        listener: (context, snackbarState) {
                          if (snackbarState is! SnackbarsInitial) {
                            BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                            late String message;
                            final bool isUrlCopied = snackbarState is UrlCopySuccess,
                                isFileCopied = snackbarState is FileCopySuccess,
                                isShareFailed = snackbarState is ShareAttemptFailure;
                            if (isUrlCopied) {
                              message = AppLocalizations.of(context).urlCopiedMessage;
                            } else if (snackbarState is ColorCopySuccess) {
                              message = AppLocalizations.of(context).colorCopiedMessage(snackbarState.clipboard);
                            } else if (isFileCopied) {
                              message = AppLocalizations.of(context).formatCopied(snackbarState.format);
                            } else if (snackbarState is ServerStatusCheckSuccess) {
                              message = AppLocalizations.of(context).serverMaintanceMessage;
                            } else if (isShareFailed) {
                              message = AppLocalizations.of(context).shareFailedMessage;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(message),
                                behavior: (isUrlCopied || isShareFailed || isFileCopied)
                                    ? isPortrait
                                        ? SnackBarBehavior.fixed
                                        : SnackBarBehavior.floating
                                    : SnackBarBehavior.floating,
                                action: isUrlCopied
                                    ? SnackBarAction(
                                        textColor: Theme.of(context).scaffoldBackgroundColor,
                                        label: AppLocalizations.of(context).urlOpenButtonLabel.toUpperCase(),
                                        onPressed: () =>
                                            BlocProvider.of<SnackbarBloc>(context).add(const UrlOpenedSuccess()))
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
                                child: navTabs.elementAt(navState.tabIndex),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    bottomNavigationBar: isPortrait ? BottomNavBar(navState) : null,
                  ),
                ),
              ),
            );
          },
        ),
      );
}
