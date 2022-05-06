import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_info/platform_info.dart';

import '../../../common/ui/widgets/helpers/orientation_switcher.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../testing/test_keys.dart';
import '../../blocs/onboarding_bloc.dart';
import '../widgets/animations/pull_to_refresh_animation.dart';
import '../widgets/animations/spacebar_animation.dart';
import '../widgets/onboarding_tile.dart';

class OnboardingOverlay extends StatelessWidget {
  final int length;
  final BoxConstraints size;

  const OnboardingOverlay({
    required this.size,
    required this.length,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = context.media.orientation == Orientation.portrait;

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (_, OnboardingState state) => (state is OnboardingDoneSuccess)
          ? const SizedBox.shrink(key: TestKeys.disappearedOnboard)
          : Stack(
              children: <Widget>[
                IgnorePointer(
                  child: ColoredBox(
                    color: Colors.grey.withOpacity(0.1),
                    child: OrientationSwitcher(
                      isPortrait: isPortrait,
                      children: <Widget>[
                        OnboardingTile(
                          context.l10n.onboardingLockTip,
                          isPortrait: isPortrait,
                        ),
                        OnboardingTile(
                          isPortrait ? context.l10n.onboardingSelectTip : context.l10n.onboardingSelectTipLandscape,
                          begin: -0.6,
                          end: 0.1,
                          isPortrait: isPortrait,
                          oppositeSide: true,
                        ),
                        OnboardingTile(
                          context.l10n.onboardingMoveTip,
                          isPortrait: isPortrait,
                          icon: Icons.drag_handle_outlined,
                        ),
                        if (isPortrait)
                          OnboardingTile(
                            context.l10n.onboardingSaveTip,
                            begin: 0.5,
                            additionalText: context.l10n.onboardingGenerateTip,
                            isPortrait: isPortrait,
                            oppositeSide: true,
                          )
                        else
                          OnboardingTile(
                            context.l10n.onboardingGenerateTipLandscape,
                            end: 1,
                            isPortrait: isPortrait,
                            oppositeSide: true,
                          ),
                        if (isPortrait)
                          OnboardingTile('', begin: -0.1, end: 0.8, isPortrait: isPortrait)
                        else
                          OnboardingTile(
                            context.l10n.onboardingSaveTipLandscape,
                            isPortrait: isPortrait,
                          ),
                      ],
                    ),
                  ),
                ),
                if (isPortrait && platform.isMobile)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: size.maxHeight / length,
                    child: SizedBox(
                      width: size.maxWidth * 0.66,
                      height: size.maxHeight / (length - 2),
                      child: Transform.scale(scale: 0.66, child: const PullToRefreshAnimation()),
                    ),
                  )
                else
                  Align(
                    alignment: Alignment(0, isPortrait ? 0.7 : 0),
                    child: const SpaceBarAnimation(Colors.white),
                  ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: size.maxWidth / (isPortrait ? 3 : length),
                    height: size.maxHeight / length,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: context.theme.indicatorColor),
                        onPressed: () => BlocProvider.of<OnboardingBloc>(context).add(const OnboardingFinished()),
                        child: Text(
                          context.l10n.onboardingDoneButtonLabel,
                          key: TestKeys.onboardingFinish,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
