import 'package:flutter_test/flutter_test.dart';
import 'package:sloykabakery/core/exceptions.dart';
import 'package:sloykabakery/features/menu/data/models/api_menu_data.dart';
import 'package:sloykabakery/features/cafes/data/models/api_cafe.dart';

void main() {
  final product = <String, dynamic>{
    'id': 1,
    'category': {'id': 2, 'name': 'Завтраки'},
    'name': 'Сырники',
    'description': '',
    'price': 193,
    'photo': null,
  };
  test(
    'valid menu allows a missing photo and preserves stable identifiers',
    () {
      final data = ApiMenuData.fromJson([product]).toDomain();
      expect(data.products.single.id, 1);
      expect(data.products.single.imageUrl, isNull);
      expect(data.categories.single.id, 2);
    },
  );
  for (final malformed in [
    null,
    'invalid',
    {'id': 'wrong'},
    {'id': 1, 'name': null},
  ]) {
    test('malformed category $malformed becomes a validation error', () {
      expect(
        () => ApiMenuData.fromJson([
          {...product, 'category': malformed},
        ]),
        throwsA(isA<DataValidationException>()),
      );
    });
  }
  test('a non-object product becomes a validation error', () {
    expect(
      () => ApiMenuData.fromJson([null]),
      throwsA(isA<DataValidationException>()),
    );
  });
  test('wrong price type is rejected before persistence', () {
    expect(
      () => ApiMenuData.fromJson([
        {...product, 'price': '193'},
      ]),
      throwsA(isA<DataValidationException>()),
    );
  });
  final cafe = <String, dynamic>{
    'id': 1,
    'address': 'Адрес',
    'work_time': '9–21',
    'extra': '',
    'latitude': 59,
    'longitude': 30,
  };
  test('integer coordinates are valid JSON numbers', () {
    expect(ApiCafe.fromJson(cafe).toDomain().latitude, 59.0);
  });
  for (final latitude in [91, double.nan, double.infinity, '59']) {
    test('invalid latitude $latitude is rejected', () {
      expect(
        () => ApiCafe.fromJson({...cafe, 'latitude': latitude}),
        throwsA(isA<DataValidationException>()),
      );
    });
  }
}
