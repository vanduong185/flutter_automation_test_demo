import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:automation_test_demo/main.dart';

void main() {
  // final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Red item is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MyHomePageWrapper());

    expect(find.text("red"), findsOneWidget);
  });

  testWidgets('Pink item is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(MyHomePageWrapper());

    expect(find.text("pink"), findsOneWidget);
  });

  testWidgets('Green item is displayed in the bottom of listview',
      (WidgetTester tester) async {
    // binding.window.physicalSizeTestValue = Size(800, 700);
    // binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(MyHomePageWrapper());

    // scroll to bottom
    await tester.drag(find.byType(ListView), const Offset(0.0, -300));
    await tester.pump();

    expect(find.text("green"), findsOneWidget);
  });

  testWidgets("tap color", (WidgetTester tester) async {
    await tester.pumpWidget(MyHomePageWrapper());

    await tester.tap(find.byKey(Key("ges_red")));
    await tester.pump();

    WidgetPredicate widgetSelectedPredicate = (Widget widget) {
      return (widget is Card &&
          widget.key == Key("card_red") &&
          widget.color == Colors.blue.shade100);
    };

    expect(find.byWidgetPredicate(widgetSelectedPredicate), findsOneWidget);
  });
}

class MyHomePageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(
        size: Size(400, 900),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}
