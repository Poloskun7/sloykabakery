import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:sloykabakery/widgets/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/categories_widget.dart';
import 'package:sloykabakery/widgets/header_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/products_widget.dart';

final productsProvider = StateProvider<List<ProductWidget>>((ref) => []);
final categoriesProvider = StateProvider<Set<CategoryWidget>>((ref) => {});
final selectedCategoryProvider = StateProvider<int>((ref) => 1);

class MenuScreen extends ConsumerWidget {
  final Set<CategoryWidget> categoryWidgets = {};
  final List<ProductWidget> productWidgets = [];

  MenuScreen({super.key});

  Future<void> getProducts(WidgetRef ref) async {
    var headers = {
      'sltoken': '32232',
    };

    final cacheOptions = buildCacheOptions(
      const Duration(minutes: 1),
      options: Options(
        headers: headers,
      ),
    );

    final dio = Dio();
    // dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    final response = await dio.get(
      'https://r24api.photonhost.net/sl/products/',
      options: cacheOptions,
    );

    productWidgets.clear();
    for (var item in response.data) {
      addCategoryButton(item);
      productWidgets.add(ProductWidget(
          categoryId: item['category']['id'],
          name: item['name'],
          description: item['description'],
          price: item['price']));
    }

    ref.read(productsProvider.notifier).state = productWidgets;
    ref.read(categoriesProvider.notifier).state = categoryWidgets;
  }

  void addCategoryButton(var button) {
    if (categoryWidgets.any(
        (existingButton) => existingButton.id == button['category']['id'])) {
      return;
    }
    categoryWidgets.add(CategoryWidget(
        id: button['category']['id'], name: button['category']['name']));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getProducts(ref);
    final categories = ref.watch(categoriesProvider);
    final List<CategoryWidget> categoriesList = categories.toList();
    final products = ref.watch(productsProvider);
    return CustomSliverAppBar(
      widgets: [
        const SizedBox(height: 20),
        const HeaderWidget(name: 'Меню'),
        const SizedBox(height: 20),
        if (categories.isNotEmpty && products.isNotEmpty) ...[
          const CategoriesWidget(),
          const SizedBox(height: 20),
          HeaderWidget(
              name:
                  categoriesList[ref.watch(selectedCategoryProvider) - 1].name),
          const SizedBox(height: 20),
          const ProductsWidget()
        ] else
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
