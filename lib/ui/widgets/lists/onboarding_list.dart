import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

import '../../../blocs/onboarding/onboarding_bloc.dart';
import '../../../flutter_colors_ai_keys.dart';
import '../animated/pull_to_refresh.dart';
import 'default_grey_colors_list.dart';

class OnboardingList extends DefaultGreyList {
  const OnboardingList({required double tileWidth, required double tileHeight})
      : super(tileWidth: tileWidth, tileHeight: tileHeight);

  SizedBox _onboardingTile(String text, {bool leftAlign = true}) => SizedBox(
        height: tileHeight,
        width: tileWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-0.6, 0),
              colors:
                  leftAlign ? [Colors.grey, Colors.grey.withOpacity(0.1)] : [Colors.grey.withOpacity(0.1), Colors.grey],
            ),
          ),
          child: Align(
            alignment: Alignment(leftAlign ? -0.8 : 0.8, 0),
            child: SizedBox(
              width: tileWidth / 3,
              child: Center(
                child: Text(
                  text,
                  textAlign: leftAlign ? TextAlign.left : TextAlign.right,
                  textScaleFactor: 1,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) => (state is OnboardingDoneSuccess)
            ? const SizedBox.shrink(key: FlutterColorsAIKeys.disappearedOnboard)
            : Stack(
                children: [
                  IgnorePointer(
                    child: ColoredBox(
                      color: Colors.grey.withOpacity(0.1),
                      child: Column(
                        children: <SizedBox>[
                          _onboardingTile('Double tap anywhere to lock the color'),
                          _onboardingTile('Tap on the left part to select a color', leftAlign: false),
                          SizedBox(
                            width: tileWidth,
                            height: tileHeight,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: const Alignment(-0.1, 0),
                                      colors: [Colors.grey, Colors.grey.withOpacity(0.1)])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: tileWidth / 1.4,
                                    child: const Text(
                                      'The position of the colors does\nmatter, hold & drag to reorder them',
                                      textScaleFactor: 1,
                                    ),
                                  ),
                                  const Icon(Mdi.dragHorizontalVariant, size: 32)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: tileWidth,
                            height: tileHeight * 2,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.grey, Colors.grey.withOpacity(0.1)],
                                    begin: const Alignment(0, -0.6),
                                    end: Alignment.bottomCenter),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: tileWidth / 3.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          'Pull down to generate new colors',
                                          textScaleFactor: 1,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: tileHeight / 2)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width: tileWidth / 7, height: tileHeight, child: const PullToRefreshAnimation()),
                                  SizedBox(
                                    width: tileWidth / 3.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          'Tap the button below to save your colors',
                                          textAlign: TextAlign.right,
                                          textScaleFactor: 1,
                                        ),
                                        SizedBox(height: tileHeight / 2)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: tileWidth / 3,
                      height: tileHeight,
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                          onPressed: () => BlocProvider.of<OnboardingBloc>(context).add(const OnboardingFinished()),
                          child: const Text('GOT IT!', textScaleFactor: 1, key: FlutterColorsAIKeys.onboardingFinish),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      );
}
