import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sloykabakery/core/widgets/startup_app.dart';

void main() {
  testWidgets('storage failure is visible and retry opens the app', (
    tester,
  ) async {
    var attempts = 0;
    await tester.pumpWidget(
      StartupApp(
        configured: true,
        initialize: () async {
          if (++attempts == 1) throw StateError('storage unavailable');
        },
        child: const MaterialApp(home: Text('Ready')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Не удалось открыть данные'), findsOneWidget);
    await tester.tap(find.text('Повторить'));
    await tester.pumpAndSettle();
    expect(find.text('Ready'), findsOneWidget);
    expect(attempts, 2);
  });
  testWidgets('missing build configuration does not initialize storage', (
    tester,
  ) async {
    var initialized = false;
    await tester.pumpWidget(
      StartupApp(
        configured: false,
        initialize: () async {
          initialized = true;
        },
        child: const SizedBox(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Сборка не настроена'), findsOneWidget);
    expect(initialized, isFalse);
  });
}
