import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/data/repositories/menu_data_repo.dart';
import 'package:sloykabakery/domain/models/category.dart';
import 'package:sloykabakery/domain/models/menu_data.dart';
import 'package:sloykabakery/domain/models/product.dart';
import 'package:sloykabakery/providers/category_provider.dart';

class MenuViewModel extends StateNotifier<AsyncValue<MenuData>> {
  final MenuDataRepo repository;
  final Ref ref;

  MenuViewModel({
    required this.repository,
    required this.ref,
  }) : super(const AsyncValue.loading()) {
    loadMenuData();
  }

  Future<void> loadMenuData() async {
    print("Загрузка данных...");
    state = const AsyncValue.loading();
    try {
      final menuData = await repository.getMenuData();
      print(
          "Данные загружены: ${menuData.categories.length} категорий и ${menuData.products.length} продуктов");
      state = AsyncValue.data(menuData);
    } on AppException catch (e, s) {
      if (e is NoInternetException || e is ApiTimeoutException) {
        state = AsyncValue.error(e, s);
      } else {
        state = AsyncValue.error(
          ApiException(e.toString()),
          s,
        );
      }
    } catch (e, s) {
      state = AsyncValue.error(
        AppException('Unknown error: ${e.toString()}'),
        s,
      );
    }
  }

  List<Category> getCategories() {
    if (state is AsyncData<MenuData>) {
      return (state as AsyncData<MenuData>).value.categories.toList();
    }
    return [];
  }

  // int getSelectedCategory() {
  //   final selectedCategory = ref.watch(selectedCategoryProvider);
  //   return selectedCategory;
  // }

  void selectCategory(int categoryId) {
    ref.read(selectedCategoryProvider.notifier).state = categoryId;
  }

  List<Product> getProductsByCategory(int categoryId) {
    if (state is! AsyncData<MenuData>) return [];
    return state.when(
      data: (menuData) =>
          menuData.products.where((p) => p.categoryId == categoryId).toList(),
      loading: () => [],
      error: (_, __) => [],
    );
  }
}
