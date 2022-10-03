import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

import '../../../../app/theme/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';
import '../../../blocs/remove_favorites/remove_favorites_bloc.dart';

class RemoveAllFavoritesButton extends StatefulWidget {
  const RemoveAllFavoritesButton({super.key});

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
    animation = Tween<double>(begin: 0.4, end: 1).animate(animationController);
    animationController.repeat(reverse: true);
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
            SchedulerBinding.instance.addPostFrameCallback(
              // ignore: prefer-async-await, for readability.
              (_) async => showModal<bool>(
                context: dialogContext,
                configuration: const FadeScaleTransitionConfiguration(
                  transitionDuration: kDefaultTransitionDuration,
                  reverseTransitionDuration: kDefaultReverseTransitionDuration,
                ),
                // Because https://material.io/components/dialogs#alert-dialog.
                builder: (_) => AlertDialog(
                  contentPadding: const EdgeInsets.only(top: 40),
                  shape: kDefaultShape,
                  content: Text(
                    haveSelection
                        ? '${context.l10n.removeSomeTitle(state.selections.length)}?'
                        : '${context.l10n.removeAllTitle}?',
                    textAlign: TextAlign.center,
                  ),
                  actions: <TextButton>[
                    TextButton(
                      onPressed: () => dialogContext.closeDialog(false),
                      child: Text(context.materialL10n.cancelButtonLabel.toBeginningOfSentenceCase()),
                    ),
                    TextButton(
                      onPressed: () => dialogContext.closeDialog(true),
                      child: Text(
                        context.l10n.removeButtonLabel,
                        style: TextStyle(color: context.theme.errorColor),
                      ),
                    ),
                  ],
                ),
              ).then(
                (bool? toRemove) {
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
            builder: (_, FavoritesState favState) => IconButton(
              tooltip:
                  haveSelection ? context.l10n.removeSomeTitle(state.selections.length) : context.l10n.removeAllTitle,
              icon: Stack(
                children: <Widget>[
                  if (haveSelection)
                    FadeTransition(
                      opacity: animation,
                      child: Icon(
                        Mdi.bookmarkRemoveOutline,
                        size: 25,
                        color: context.theme.errorColor,
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
