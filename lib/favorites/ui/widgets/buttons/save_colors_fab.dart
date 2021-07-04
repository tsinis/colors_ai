import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../general/repository/colors_repository.dart';
import '../../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/add_favorites/fab_bloc.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';

class SaveColorsFAB extends StatefulWidget {
  const SaveColorsFAB({this.isExtended});

  final bool? isExtended;

  @override
  _SaveColorsFABState createState() => _SaveColorsFABState();
}

class _SaveColorsFABState extends State<SaveColorsFAB> with SingleTickerProviderStateMixin {
  late final Animation<double> fabAnimation;
  late final AnimationController controller;

  bool isGenerateTab = true, isFailed = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..forward();
    fabAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  bool get alwaysShow => widget.isExtended != null;
  bool get isExtended => widget.isExtended ?? false;
  bool get isDisabled => isFailed || !isGenerateTab;

  void onFabPressed() {
    BlocProvider.of<SoundBloc>(context).add(const SoundFavoritesAdded());
    BlocProvider.of<FavoritesBloc>(context).add(FavoritesAdded(favorite: context.read<ColorsRepository>().toPalette()));
    if (!alwaysShow) {
      controller.reverse();
    }
  }

  String get tooltip => AppLocalizations.of(context).savePaletteToFavorites;

  static const Icon icon = Icon(Icons.bookmark_add_outlined);

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: fabAnimation,
        child: BlocBuilder<FabBloc, FabState>(
          builder: (_, state) {
            // https://material.io/design/environment/elevation.html#elevation-in-material-design
            if (state is FabHideInitial && !alwaysShow) {
              controller.reverse();
            } else if (state is FabShowInitial && !alwaysShow) {
              controller.forward();
            }
            return Padding(
                padding: isExtended ? const EdgeInsets.fromLTRB(16, 8, 16, 0) : const EdgeInsets.only(top: 8),
                child: MultiBlocListener(
                  listeners: [
                    if (alwaysShow)
                      BlocListener<ColorsBloc, ColorsState>(
                          listener: (_, colorState) => isFailed = colorState is ColorsFailure),
                    BlocListener<NavigationBloc, NavigationState>(
                      listener: (_, navState) => isGenerateTab = navState.tabIndex == 1,
                    ),
                  ],
                  child: FloatingActionButton.extended(
                    disabledElevation: 2,
                    backgroundColor: isDisabled ? Theme.of(context).scaffoldBackgroundColor : null,
                    isExtended: isExtended,
                    onPressed: isDisabled ? null : onFabPressed,
                    label: const Text('Add to Favorites'), //TODO Add to AppLocalizations.
                    icon: icon,
                    tooltip: tooltip,
                  ),
                ));
          },
        ),
      );
}
