// Widget test for the AnimatedContainer expandable card.

import 'package:flutter_test/flutter_test.dart';

import 'package:animated_container_demo/main.dart';

void main() {
  testWidgets('tapping the card toggles expand/collapse', (tester) async {
    await tester.pumpWidget(const DemoApp());

    // Starts collapsed.
    expect(find.text('Tap to expand'), findsOneWidget);
    expect(find.text('Tap to collapse'), findsNothing);

    // Tap to expand, then let the animation settle.
    await tester.tap(find.text('Tap to expand'));
    await tester.pumpAndSettle();

    expect(find.text('Tap to collapse'), findsOneWidget);
    expect(find.text('Tap to expand'), findsNothing);
  });
}
