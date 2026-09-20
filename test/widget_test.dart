import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_portfolio/main.dart';

void main() {
  testWidgets('portfolio renders current headline and primary actions', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Mobile Software Engineer'), findsOneWidget);
    expect(find.text('View My Work'), findsOneWidget);
    expect(find.text('Get In Touch'), findsOneWidget);
  });
}
