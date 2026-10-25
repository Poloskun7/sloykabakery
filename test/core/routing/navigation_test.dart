import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sloykabakery/core/routing/router.dart';
import 'package:sloykabakery/core/themes/theme.dart';
import 'package:sloykabakery/features/home/presentation/home_screen.dart';
import 'package:sloykabakery/features/menu/presentation/menu_screen.dart';
import 'package:sloykabakery/features/cafes/presentation/cafes_screen.dart';
import 'package:sloykabakery/features/favorites/presentation/favorites_screen.dart';

void main() {
  testWidgets('Switches between all four tabs repeatedly', (tester) async {
    final router = createRouter();
    addTearDown(router.dispose);

    await tester.pumpWidget(
      MaterialApp.router(theme: appTheme(), routerConfig: router),
    );
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);

    for (var round = 0; round < 2; round++) {
      await tester.tap(find.widgetWithText(TextButton, 'Меню'));
      await tester.pumpAndSettle();
      expect(find.byType(MenuScreen), findsOneWidget);
      expect(find.byType(HomeScreen), findsNothing);

      await tester.tap(find.widgetWithText(TextButton, 'Кофейни'));
      await tester.pumpAndSettle();
      expect(find.byType(CafesScreen), findsOneWidget);
      expect(find.byType(MenuScreen), findsNothing);

      await tester.tap(find.byTooltip('Избранное'));
      await tester.pumpAndSettle();
      expect(find.byType(FavoritesScreen), findsOneWidget);
      expect(find.byType(CafesScreen), findsNothing);

      await tester.tap(find.widgetWithText(TextButton, 'Витрина'));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(FavoritesScreen), findsNothing);
    }
  });
}
