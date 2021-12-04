import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mdi/mdi.dart';

import '../../../../app/theme/constants.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';
import '../../../blocs/remove_favorites/remove_favorites_bloc.dart';

class RemoveAllFavoritesButton extends StatefulWidget {
  const RemoveAllFavoritesButton();

  @override
  State<RemoveAllFavoritesButton> createState() => _RemoveAllFavoritesButtonState();
}

class _RemoveAllFavoritesButtonState extends State<RemoveAllFavoritesButton> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: kDefaultLongTransitionDuration);
    // ignore: prefer_int_literals
    animation = Tween(begin: 0.4, end: 1.0).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (BuildContext dialogContext, RemoveFavoritesState state) {
          final bool haveSelection = state.selections.isNotEmpty;
          if (state is RemoveFavoritesOpenDialogInitial) {
            SchedulerBinding.instance?.addPostFrameCallback(
              (_) async => showModal<bool>(
                context: dialogContext,
                configuration: const FadeScaleTransitionConfiguration(
                  transitionDuration: kDefaultTransitionDuration,
                  reverseTransitionDuration: kDefaultReverseTransitionDuration,
                ),
                // https://material.io/components/dialogs#alert-dialog
                builder: (_) => AlertDialog(
                  actionsPadding: const EdgeInsets.only(bottom: 8, right: 8),
                  shape: kDefaultShape,
                  content: Text(
                    haveSelection
                        ? '${AppLocalizations.of(context).removeSomeTitle(state.selections.length)}?'
                        : '${AppLocalizations.of(context).removeAllTitle}?',
                  ),
                  actions: <TextButton>[
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext, false),
                      child: Text(MaterialLocalizations.of(context).cancelButtonLabel.toBeginningOfSentenceCase()),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext, true),
                      child: Text(
                        AppLocalizations.of(context).removeButtonLabel,
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    ),
                  ],
                ),
              ).then(
                (toRemove) {
                  if (toRemove ?? false) {
                    BlocProvider.of<FavoritesBloc>(context).add(FavoritesSeveralRemoved(state.selections));
                    BlocProvider.of<RemoveFavoritesBloc>(context).add(const RemoveFavoritesRemoved());
                  }
                },
              ),
            );
            BlocProvider.of<RemoveFavoritesBloc>(dialogContext).add(const RemoveFavoritesHided());
          }

          return BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (_, favState) => IconButton(
              tooltip: haveSelection
                  ? AppLocalizations.of(context).removeSomeTitle(state.selections.length)
                  : AppLocalizations.of(context).removeAllTitle,
              icon: Stack(
                children: [
                  if (haveSelection)
                    FadeTransition(
                      opacity: animation,
                      child: Icon(
                        Mdi.bookmarkRemoveOutline,
                        size: 25,
                        color: Theme.of(context).errorColor,
                      ),
                    )
                  else
                    const Icon(Mdi.bookmarkRemoveOutline, size: 25),
                  const Icon(Mdi.bookmarkOutline, size: 25),
                ],
              ),
              onPressed: favState is FavoritesLoadSuccess
                  ? () => BlocProvider.of<RemoveFavoritesBloc>(dialogContext).add(
                        const RemoveFavoritesShowed(),
                      )
                  : null,
            ),
          );
        },
      );
}
