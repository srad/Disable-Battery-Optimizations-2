import 'package:flutter_test/flutter_test.dart';

import 'package:disable_battery_optimization_2_example/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Disable Battery Optimizations Plugin example app'), findsOneWidget);
    expect(find.text('Is Auto Start Enabled'), findsOneWidget);
  });
}
