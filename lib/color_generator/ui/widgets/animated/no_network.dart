import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import 'no_network/illustrations/decorative_symbols.dart';
import 'no_network/illustrations/transmitter_tower.dart';
import 'no_network/pulse_animation.dart';

class NoNetwork extends StatefulWidget {
  final Duration repeatPeriod;

  const NoNetwork({
    this.repeatPeriod = const Duration(seconds: 4),
    super.key,
  });

  @override
  State<NoNetwork> createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    startAnimation();
  }

  void startAnimation() => controller
    ..stop()
    ..reset()
    ..repeat(period: widget.repeatPeriod);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: 480,
          height: 480,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: <Widget>[
              SizedBox(width: 320, child: CustomPaint(painter: PulseAnimation(controller))),
              Positioned(
                top: 0,
                child: FadeTransition(
                  opacity: controller.drive(Tween<double>(begin: 1, end: 0.2)),
                  child: const CustomPaint(
                    size: Size(250, 250),
                    painter: DecorativeSymbols(),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                child: CustomPaint(
                  size: const Size(300, 400),
                  painter: TransmitterTower(color: context.theme.primaryIconTheme.color!),
                ),
              ),
            ],
          ),
        ),
      );
}
