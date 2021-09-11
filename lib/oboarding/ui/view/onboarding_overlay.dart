import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../../common/ui/widgets/helpers/orientation_switcher.dart';
import '../../../testing/test_keys.dart';
import '../../blocs/onboarding/onboarding_bloc.dart';
import '../widgets/animations/pull_to_refresh.dart';
import '../widgets/animations/spacebar_animation.dart';
import '../widgets/onboarding_tile.dart';

class OnboardingOverlay extends StatelessWidget {
  const OnboardingOverlay({required this.size, required this.length});

  final BoxConstraints size;
  final int length;

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (_, state) => (state is OnboardingDoneSuccess)
          ? const SizedBox.shrink(key: TestKeys.disappearedOnboard)
          : Stack(
              children: [
                IgnorePointer(
                  child: ColoredBox(
                    color: Colors.grey.withOpacity(0.1),
                    child: OrientationSwitcher(
                      isPortrait: isPortrait,
                      children: [
                        OnboardingTile(
                          AppLocalizations.of(context).onboardingLockTip,
                          isPortrait: isPortrait,
                        ),
                        OnboardingTile(
                          isPortrait
                              ? AppLocalizations.of(context).onboardingSelectTip
                              : AppLocalizations.of(context).onboardingSelectTipLandscape,
                          begin: -0.6,
                          end: 0.1,
                          isPortrait: isPortrait,
                          oppositeSide: true,
                        ),
                        OnboardingTile(
                          AppLocalizations.of(context).onboardingMoveTip,
                          isPortrait: isPortrait,
                          icon: Icons.drag_handle_outlined,
                        ),
                        if (isPortrait)
                          OnboardingTile(
                            AppLocalizations.of(context).onboardingSaveTip,
                            begin: 0.5,
                            additionalText: AppLocalizations.of(context).onboardingGenerateTip,
                            isPortrait: isPortrait,
                            oppositeSide: true,
                          )
                        else
                          OnboardingTile(
                            AppLocalizations.of(context).onboardingGenerateTipLandscape,
                            end: 1,
                            isPortrait: isPortrait,
                            oppositeSide: true,
                          ),
                        if (isPortrait)
                          OnboardingTile('', begin: -0.1, end: 0.8, isPortrait: isPortrait)
                        else
                          OnboardingTile(
                            AppLocalizations.of(context).onboardingSaveTipLandscape,
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
                        style: ElevatedButton.styleFrom(primary: Theme.of(context).indicatorColor),
                        onPressed: () => BlocProvider.of<OnboardingBloc>(context).add(const OnboardingFinished()),
                        child: Text(
                          AppLocalizations.of(context).onboardingDoneButtonLabel.toUpperCase(),
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
