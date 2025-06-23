import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/providers/category_provider.dart';
import 'package:sloykabakery/providers/menu_view_model_provider.dart';
import 'package:sloykabakery/ui/core/ui/custom_sliver_app_bar.dart';
import 'package:sloykabakery/ui/core/ui/error_screen.dart';
import 'category_list.dart';
import 'product_list.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuState = ref.watch(menuViewModelProvider);
    final viewModel = ref.read(menuViewModelProvider.notifier);
    final selectedCategory = ref.watch(selectedCategoryProvider); //Временно

    return Scaffold(
      body: menuState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) {
          return e is NoInternetException
              ? ErrorScreen(
                  iconData: Icons.wifi_off,
                  error: 'Нет подключения к интернету',
                  message: 'Проверьте соединение и попробуйте снова',
                  onRetry: () =>
                      ref.read(menuViewModelProvider.notifier).loadMenuData(),
                  buttonText: 'Повторить',
                )
              : e is ApiTimeoutException
                  ? ErrorScreen(
                      iconData: Icons.timer_off,
                      error: 'Превышено время ожидания',
                      message: 'Сервер долго не отвечает. Попробуйте позже',
                      onRetry: () => ref
                          .read(menuViewModelProvider.notifier)
                          .loadMenuData(),
                      buttonText: 'Повторить',
                    )
                  : e is ApiException
                      ? ErrorScreen(
                          iconData: Icons.cloud_off,
                          error: 'Ошибка сервера',
                          message:
                              'Произошла ошибка на сервере. Мы уже работаем над этим',
                          onRetry: () => ref
                              .read(menuViewModelProvider.notifier)
                              .loadMenuData(),
                          buttonText: 'Повторить',
                        )
                      : ErrorScreen(
                          iconData: Icons.engineering,
                          error: 'Идут технические работы',
                          message: 'Мы улучшаем приложение для вас',
                          onRetry: () => ref
                              .read(menuViewModelProvider.notifier)
                              .loadMenuData(),
                          buttonText: 'Проверить статус',
                        );
        },
        data: (_) {
          final categories = viewModel.getCategories();
          final products = viewModel.getProductsByCategory(selectedCategory);
          return CustomSliverAppBar(
            widgets: [
              CategoryList(categories: categories),
              ProductList(products: products),
            ],
          );
        },
      ),
    );
  }
}
