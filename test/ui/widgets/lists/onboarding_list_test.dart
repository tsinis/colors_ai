import 'package:colors_ai/blocs/onboarding/onboarding_bloc.dart';
import 'package:colors_ai/flutter_colors_ai_keys.dart';
import 'package:colors_ai/models/colors/constants.dart';
import 'package:colors_ai/ui/widgets/lists/onboarding_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive/hive.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  testWidgets('onboarding should dissapear after tap on "GOT IT" button', (tester) async {
    await Hive.initFlutter();

    final button = find.byKey(FlutterColorsAIKeys.onboardingFinish);
    final dissapear = find.byKey(FlutterColorsAIKeys.disappearedOnboard);
    final TestViewConfiguration defaultConfig = TestViewConfiguration();

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => OnboardingBloc(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: FittedBox(
            child: OnboardingList(
              tileWidth: defaultConfig.size.width,
              tileHeight: defaultConfig.size.height / defaultColors.length,
            ),
          ),
        ),
      ),
    );

    expect(button, findsOneWidget);
    expect(dissapear, findsNothing);

    await tester.tap(button);
    await tester.pump();

    expect(button, findsNothing);
    expect(dissapear, findsOneWidget);
  });
}
