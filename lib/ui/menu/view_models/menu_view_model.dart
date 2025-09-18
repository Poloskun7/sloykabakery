import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/data/repositories/menu_data_repo.dart';
import 'package:sloykabakery/domain/models/category.dart';
import 'package:sloykabakery/domain/models/menu_data.dart';
import 'package:sloykabakery/domain/models/product.dart';

import 'dart:developer' as dev;

class MenuState {
  final bool isLoading;
  final MenuData? menuData;
  final int? selectedCategoryId;
  final AppException? error;

  const MenuState._({
    this.isLoading = false,
    this.menuData,
    this.selectedCategoryId,
    this.error,
  });

  const MenuState.loading() : this._(isLoading: true);
  const MenuState.data(MenuData menuData, {required int selectedCategoryId})
      : this._(menuData: menuData, selectedCategoryId: selectedCategoryId);
  const MenuState.error(AppException e) : this._(error: e);

  bool get hasError => error != null;
}


class MenuViewModel extends StateNotifier<MenuState> {
  final MenuDataRepo repository;

  MenuViewModel({required this.repository}) : super(const MenuState.loading()) {
    loadMenuData();
  }

  Future<void> loadMenuData() async {
    state = const MenuState.loading();
    try {
      final menuData = await repository.getMenuData();

      // по умолчанию выбираем первую категорию
      final firstCategoryId = menuData.categories.isNotEmpty
          ? menuData.categories.first.id
          : null;

      state = MenuState.data(menuData, selectedCategoryId: firstCategoryId ?? -1);
    } on AppException catch (e) {
      state = MenuState.error(e);
    } catch (e) {
      state = MenuState.error(AppException('Unknown error: $e'));
    }
  }

  void selectCategory(int categoryId) {
    final current = state;
    if (current.menuData != null) {
      state = MenuState.data(
        current.menuData!,
        selectedCategoryId: categoryId,
      );
    }
  }

  List<Category> getCategories() {
    return state.menuData?.categories.toList() ?? [];
  }

  List<Product> getProductsByCategory() {
    final menuData = state.menuData;
    final selectedId = state.selectedCategoryId;
    if (menuData == null || selectedId == null) return [];
    return menuData.products.where((p) => p.categoryId == selectedId).toList();
  }
}
