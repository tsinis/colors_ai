import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

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
              colors: leftAlign ? [Colors.black87, Colors.black38] : [Colors.black38, Colors.black87],
            ),
          ),
          child: Align(
            alignment: Alignment(leftAlign ? -0.8 : 0.8, 0),
            child: SizedBox(
              width: tileWidth / 3,
              child: Center(
                child: Text(text,
                    textAlign: leftAlign ? TextAlign.left : TextAlign.right,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Column(
          children: <SizedBox>[
            _onboardingTile('Double tap anywhere to lock the color'),
            _onboardingTile('Tap on the left part to select a color', leftAlign: false),
            SizedBox(
              width: tileWidth,
              height: tileHeight,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.black87, Colors.black26]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: tileWidth / 1.4,
                        child: const Text('The position of the colors does\nmatter, hold & drag to reorder them',
                            style: TextStyle(color: Colors.white))),
                    const Icon(Mdi.dragHorizontalVariant, color: Colors.white, size: 32)
                  ],
                ),
              ),
            ),
            SizedBox(
              width: tileWidth,
              height: tileHeight * 2,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black87, Colors.black38],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: tileWidth / 3.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Pull down to generate new colors', style: TextStyle(color: Colors.amber)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            // icon: const Icon(Icons.check, size: 20, color: Colors.white),
                            onPressed: () {},
                            child: const Text('GOT IT!'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: tileWidth / 6, height: tileHeight, child: const PullToRefreshAnimation()),
                    SizedBox(
                      width: tileWidth / 3.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Tap the button below to save your colors',
                              textAlign: TextAlign.right, style: TextStyle(color: Colors.white)),
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
      );
}
