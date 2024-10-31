import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:sloykabakery/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/categories.dart';
// import 'package:sloykabakery/screens/menu_screen/widgets/current_screen_widget.dart';
import 'package:sloykabakery/screens/menu_screen/widgets/product_widget.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class MenuScreen extends StatelessWidget {
  final Set<Category> categories = {};
  final List<Widget> widgets = const [
    Center(
      child: Text(
        'Меню',
        style: AppTextStyles.heading_1,
      ),
    ),
  ];

  MenuScreen({super.key});

  Future<List<ProductWidget>> getProducts() async {
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

    List<ProductWidget> productWidgets = [];
    for (var item in response.data) {
      categories.add(Category(name: item['category']['name']));
      productWidgets.add(ProductWidget(name: item['name'], price: item['price']));
    }
    for (Category category in categories) {
      print(category.name);
    }

    // if (response.statusCode == 200) {
    //   print(response.data);
    // } else {
    //   print('Error: ${response.statusCode} - ${response.statusMessage}');
    // }

    return productWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductWidget>>(
      future: getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Нет данных для отображения.'));
        } else {
          final productWidgets = snapshot.data!;
          return CustomSliverAppBar(widgets: [
            ...widgets,
            // ...categories,
            ...productWidgets,
          ]);
        }
      },
    );
  }
}
