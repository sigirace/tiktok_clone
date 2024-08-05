import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictok_clone/features/authentication/widgets/form_button.dart';

void main() {
  group(
    "Form Button Tests",
    () {
      testWidgets(
        "Enabled State",
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const Directionality(
              textDirection: TextDirection.ltr,
              child: FormButton(
                disabled: false,
              ),
            ),
          );
          expect(find.text("Next"), findsOneWidget);
          expect(
            tester
                .firstWidget<AnimatedDefaultTextStyle>(
                    find.byType(AnimatedDefaultTextStyle))
                .style
                .color,
            Colors.white,
          );
        },
      );
    },
  );
}
