import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sloykabakery/providers/category_provider.dart';
import 'package:sloykabakery/ui/menu/widgets/category_item.dart';
import 'package:sloykabakery/ui/menu/widgets/category_list.dart';

import '../../testing/models/test_categories.dart';

void main() {
  group('CategoryList Widget', () {
    testWidgets('renders horizontal list of categories', (tester) async {
      // Arrange
      final categories = TestCategories.all();
      
      final container = ProviderContainer(overrides: [
        selectedCategoryProvider.overrideWith((ref) => -1),
      ]);

      // Act
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 500,
                height: 100,
                child: CategoryList(categories: categories),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Десерты'), findsOneWidget);
      expect(find.text('Напитки'), findsOneWidget);
      expect(find.text('Выпечка'), findsOneWidget);
      expect(find.byType(CategoryItem), findsNWidgets(categories.length));
    });

    testWidgets('renders nothing for empty list', (tester) async {
      // Arrange
      final emptyCategories = TestCategories.empty();

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryList(categories: emptyCategories),
          ),
        ),
      );

      // Assert
      expect(find.byType(CategoryItem), findsNothing);
    });
  });
}
