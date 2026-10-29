import 'package:sloykabakery/features/menu/domain/product.dart';

abstract class TestProducts {
  static Product testProduct() => Product(
    categoryId: 1,
    name: 'Тирамису',
    description: 'Классический десерт',
    price: 100,
    imageUrl: null,
  );
}
