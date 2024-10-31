import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:sloykabakery/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/addresses_screen/widgets/address_widget.dart';
import 'package:sloykabakery/themes/app_theme.dart';
// import 'package:sloykabakery/screens/menu_screen/widgets/current_screen_widget.dart';
// import 'package:sloykabakery/screens/menu_screen/widgets/screen_name_widget.dart';

class AddressesScreen extends StatelessWidget {
  final List<Widget> widgets = const [
    Center(
      child: Text(
        'Наши рестораны',
        style: AppTextStyles.heading_1,
      ),
    ),
  ];

  const AddressesScreen({super.key});

  Future<List<AddressWidget>> getRestaurants() async {
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
      'https://r24api.photonhost.net/sl/caffe/',
      options: cacheOptions,
    );

    List<Map<String, dynamic>> restaurants = [];
    for (var item in response.data) {
      Map<String, dynamic> restaurant = {
        'address': item['address'],
        'work_time': item['work_time'],
        'extra': item['extra'],
        'latitude': item['latitude'],
        'longitude': item['longitude'],
      };
      restaurants.add(restaurant);
    }

    List<AddressWidget> addressWidgets = [];
    for (Map item in restaurants) {
      var addressWidget = AddressWidget(
        address: item['address'],
        time: item['work_time'],
        landmark: item['extra'],
      );
      addressWidgets.add(addressWidget);
    }

    // if (response.statusCode == 200) {
    //   print(response.data);
    // } else {
    //   print('Error: ${response.statusCode} - ${response.statusMessage}');
    // }

    return addressWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AddressWidget>>(
      future: getRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Нет данных для отображения.'));
        } else {
          // Получаем список виджетов адресов
          final addressesWidgets = snapshot.data!;
          return CustomSliverAppBar(widgets: [
            ...widgets,
            ...addressesWidgets,
          ]);
        }
      },
    );
  }
}
