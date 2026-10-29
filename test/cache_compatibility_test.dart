import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:sloykabakery/features/menu/domain/product.dart';

class LegacyProductAdapter extends TypeAdapter<Product> {
  @override
  int get typeId => 1;

  @override
  Product read(BinaryReader reader) => ProductAdapter().read(reader);

  @override
  void write(BinaryWriter writer, Product product) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(product.categoryId)
      ..writeByte(1)
      ..write(product.name)
      ..writeByte(2)
      ..write(product.description)
      ..writeByte(3)
      ..write(product.price)
      ..writeByte(4)
      ..write(product.imageUrl);
  }
}

void main() {
  late Directory directory;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('sloyka-cache-test');
    Hive.init(directory.path);
  });

  tearDown(() async {
    await Hive.close();
    Hive.resetAdapters();
    await directory.delete(recursive: true);
  });

  test(
    'Existing five-field product cache opens with the new adapter',
    () async {
      Hive.registerAdapter(LegacyProductAdapter());

      final box = await Hive.openBox<Product>('products');
      await box.put(
        'old',
        Product(
          categoryId: 1,
          name: 'Сырники',
          description: '',
          price: 193,
          imageUrl: null,
        ),
      );
      await box.close();

      Hive.resetAdapters();
      Hive.registerAdapter(ProductAdapter());

      final reopened = await Hive.openBox<Product>('products');
      expect(reopened.get('old')!.id, isNull);
      expect(reopened.get('old')!.name, 'Сырники');
    },
  );
}
