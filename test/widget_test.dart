import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'package:flutter_portfolio/main.dart';

void main() {
  testWidgets('portfolio renders current headline and primary actions', (
    WidgetTester tester,
  ) async {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Mobile Software Engineer'), findsAtLeastNWidgets(1));
    expect(find.text('View My Work'), findsAtLeastNWidgets(1));
    expect(find.text('Get In Touch'), findsAtLeastNWidgets(1));
  });
}
