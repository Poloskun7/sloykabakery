import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/core/exceptions/exceptions.dart';
import 'package:sloykabakery/providers/menu_view_model_provider.dart';
import 'package:sloykabakery/ui/core/ui/custom_sliver_app_bar.dart';
import 'package:sloykabakery/ui/core/ui/error_screen.dart';
import 'category_list.dart';
import 'product_list.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(menuViewModelProvider);
    final viewModel = ref.read(menuViewModelProvider.notifier);

    return Scaffold(
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.hasError) {
            final e = state.error!;
            if (e is NoInternetException) {
              return ErrorScreen(
                iconData: Icons.wifi_off,
                error: 'Нет подключения к интернету',
                message: 'Проверьте соединение и попробуйте снова',
                onRetry: viewModel.loadMenuData,
                buttonText: 'Повторить',
              );
            }
            if (e is ApiTimeoutException) {
              return ErrorScreen(
                iconData: Icons.timer_outlined,
                error: 'Превышено время ожидания',
                message: 'Сервер долго не отвечает. Попробуйте позже',
                onRetry: viewModel.loadMenuData,
                buttonText: 'Повторить',
              );
            }
            if (e is ApiException) {
              return ErrorScreen(
                iconData: Icons.cloud_off,
                error: 'Ошибка сервера',
                message: 'Произошла ошибка на сервере. Мы уже работаем над этим',
                onRetry: viewModel.loadMenuData,
                buttonText: 'Повторить',
              );
            }
            return ErrorScreen(
              iconData: Icons.engineering,
              error: 'Идут технические работы',
              message: 'Мы улучшаем приложение для вас',
              onRetry: viewModel.loadMenuData,
              buttonText: 'Проверить статус',
            );
          }

          // data case
          return CustomSliverAppBar(
            widgets: [
              CategoryList(
                categories: viewModel.getCategories(),
                selectedId: state.selectedCategoryId!,
                onSelect: viewModel.selectCategory,
              ),
              ProductList(products: viewModel.getProductsByCategory()),
            ],
          );
        },
      ),
    );
  }
}
