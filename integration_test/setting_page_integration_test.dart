import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sketch_flutter_project/core/keys/keys.dart';
import 'package:sketch_flutter_project/main.dart' as app;
import 'package:sketch_flutter_project/ui/scenes/dashboard_scene/dashboard_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test switch language', (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(find.byKey(Keys.loginButtonKey));
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(DashboardPage), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    final BottomNavigationBar widget =
        tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar));
    widget.onTap!(1);

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Keys.langTypeENRadioKey));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Language'), findsOneWidget);

    await tester.tap(find.byKey(Keys.langTypePlRadioKey));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Język'), findsOneWidget);

    await tester.tap(find.byKey(Keys.langTypeENRadioKey));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Language'), findsOneWidget);

    await tester.tap(find.byKey(Keys.langTypePlRadioKey));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Język'), findsOneWidget);
  });
}
