import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_info/platform_info.dart';

import '../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../color_generator/blocs/colors_locked/lock_bloc.dart';
import '../../../color_generator/ui/view/gen_colors_tab.dart';
import '../../../color_picker/blocs/colorpicker_bloc.dart';
import '../../../common/blocs/snackbars/snackbar_bloc.dart';
import '../../../common/ui/widgets/app_bar_info_title.dart';
import '../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../favorites/ui/view/favorites_tab.dart';
import '../../../favorites/ui/widgets/buttons/save_colors_fab.dart';
import '../../../navigation/blocs/navigation_bloc.dart';
import '../../../navigation/ui/widgets/bottom_nav_bar.dart';
import '../../../navigation/ui/widgets/nav_rail.dart';
import '../../../share/blocs/share_bloc.dart';
import '../../../share/repository/share_repository.dart';
import '../../../share/ui/view/share_colors_tab.dart';
import '../../../sound/blocs/sound_bloc.dart';
import '../../../sound/repository/sounds_repository.dart';
import '../../extensions/context_extensions.dart';
import '../../repository/colors_repository.dart';
import '../constants.dart';
import '../widgets/overflow_menu.dart';

class MainScreen extends StatefulWidget {
  final List<Widget> navTabs;

  const MainScreen({this.navTabs = const <Widget>[ShareColorsTab(), GenColorsTab(), FavoritesTab()], Key? key})
      : super(key: key);

  @override
  State<MainScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<MainScreen> {
  bool showGenFab = false;
  final SoundBloc soundBloc = SoundBloc(SoundsRepository());
  final FocusNode keyboardListenerNode = FocusNode(debugLabel: 'keyboard');

  bool get isPortrait => context.media.orientation == Orientation.portrait;
  SystemUiOverlayStyle get overlayStyle => context.theme.brightness == Brightness.dark
      ? SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: context.theme.cardColor)
      : SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: context.theme.navigationRailTheme.backgroundColor);

  @override
  void initState() {
    soundBloc.add(const SoundEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<BlocBase<Object?>>>[
          BlocProvider<SoundBloc>(create: (_) => soundBloc),
          BlocProvider<LockBloc>(
            create: (_) => LockBloc(context.read<ColorsRepository>())..add(const LockStarted()),
          ),
          BlocProvider<ColorsBloc>(
            create: (_) => ColorsBloc(context.read<ColorsRepository>())..add(const ColorsStarted()),
          ),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (BuildContext navContext, NavigationState navState) {
            final bool isGenTab = navState == NavigationState.generate;

            if (!isGenTab) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }

            return Shortcuts(
              shortcuts: <ShortcutActivator, Intent>{
                ...WidgetsApp.defaultShortcuts,
                const SingleActivator(kSpacebar): isGenTab ? const DoNothingIntent() : const ActivateIntent(),
              },
              child: KeyboardListener(
                focusNode: keyboardListenerNode,
                includeSemantics: false,
                autofocus: true,
                onKeyEvent: (KeyEvent event) {
                  if (event is KeyUpEvent) {
                    return;
                  }
                  if (event.logicalKey == LogicalKeyboardKey.tab && !showGenFab) {
                    setState(() => showGenFab = true);
                  }
                  if (event.logicalKey == kSpacebar && isGenTab) {
                    if (kIsWeb) {
                      BlocProvider.of<SoundBloc>(navContext).add(const SoundEvent.refreshed());
                    }
                    BlocProvider.of<ColorsBloc>(navContext).add(const ColorsGenerated());
                  }
                },
                child: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: overlayStyle,
                  child: Scaffold(
                    floatingActionButton: isPortrait ? const SaveColorsFAB() : null,
                    appBar: AppBar(
                      systemOverlayStyle: overlayStyle.copyWith(statusBarColor: Colors.transparent),
                      actions: <Widget>[kAppBarActions[navState.index], const OverflowMenu()],
                      toolbarHeight: kToolbarHeight + (platform.isMacOS ? 12 : 0),
                      title: Padding(
                        padding: EdgeInsets.only(top: platform.isMacOS ? 16 : 0),
                        child: AppBarInfoTitle(selectedTabIndex: navState.index),
                      ),
                    ),
                    body: MultiBlocProvider(
                      providers: <BlocProvider<BlocBase<Object>>>[
                        BlocProvider<ColorPickerBloc>(create: (_) => ColorPickerBloc()),
                        BlocProvider<ShareBloc>(
                          lazy: false,
                          create: (_) => ShareBloc(ShareRepository())..add(const ShareEvent.started()),
                        ),
                        BlocProvider<SnackbarBloc>(
                          create: (_) => SnackbarBloc()..add(const SnackbarEvent.serverStatusChecked()),
                        ),
                      ],
                      child: BlocListener<SnackbarBloc, SnackbarState>(
                        listener: (BuildContext context, SnackbarState snackbarState) {
                          final String? message = snackbarState.whenOrNull(
                            serverStatusCheck: () => context.l10n.serverMaintenanceMessage,
                            urlCopySuccess: (_) => context.l10n.urlCopiedMessage,
                            shareFailure: () => context.l10n.shareFailedMessage,
                            colorCopySuccess: context.l10n.colorCopiedMessage,
                            fileCopySuccess: context.l10n.formatCopied,
                          );

                          if (message == null) {
                            return;
                          }
                          BlocProvider.of<SoundBloc>(context).add(const SoundEvent.copied());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 2),
                              content: Text(message),
                              behavior: snackbarState.whenOrNull(
                                    shareFailure: () => isPortrait ? SnackBarBehavior.fixed : null,
                                    urlCopySuccess: (_) => isPortrait ? SnackBarBehavior.fixed : null,
                                    fileCopySuccess: (_) => isPortrait ? SnackBarBehavior.fixed : null,
                                  ) ??
                                  SnackBarBehavior.floating,
                              action: snackbarState.whenOrNull(
                                urlCopySuccess: (String url) => SnackBarAction(
                                  textColor: context.theme.scaffoldBackgroundColor,
                                  label: context.l10n.urlOpenButtonLabel,
                                  onPressed: () => BlocProvider.of<SnackbarBloc>(context).add(
                                    SnackbarEvent.urlOpened(url),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: SafeArea(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              if (!isPortrait) NavRail(navState, toShowGenFab: showGenFab),
                              Expanded(child: widget.navTabs.elementAt(navState.index)),
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
