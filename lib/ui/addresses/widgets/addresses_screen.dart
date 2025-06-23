import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:latlong2/latlong.dart';
import 'package:sloykabakery/ui/core/themes/colors.dart';
import 'package:sloykabakery/ui/core/ui/animated_text_widget.dart';
import 'package:sloykabakery/ui/core/ui/custom_sliver_app_bar.dart';
import 'package:sloykabakery/ui/addresses/widgets/addresses_widget.dart';
import 'package:sloykabakery/ui/addresses/widgets/map_widget.dart';
import 'package:sloykabakery/ui/home/widgets/button_widget.dart';
import 'package:sloykabakery/ui/core/themes/theme.dart';
import 'package:sloykabakery/ui/core/ui/header_widget.dart';
import 'package:sloykabakery/ui/core/ui/info_widget.dart';

final addressesProvider = StateProvider<List<AddressWidget>>((ref) => []);
final markersProvider = StateProvider<List<Marker>>((ref) => []);

class AddressesScreen extends ConsumerWidget {
  final List<AddressWidget> addressWidgets = [];
  final List<Marker> markers = [];

  AddressesScreen({super.key});

  Future<void> getRestaurants(WidgetRef ref) async {
    var headers = {
      'sltoken': '32232',
    };

    // final cacheOptions = buildCacheOptions(
    //   const Duration(minutes: 1),
    //   options: Options(
    //     headers: headers,
    //   ),
    // );

    final dio = Dio();
    // dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    final response = await dio.get(
      'https://r24api.photonhost.net/sl/caffe/',
      // options: cacheOptions,
    );

    addressWidgets.clear();
    for (var item in response.data) {
      addressWidgets.add(AddressWidget(
          address: item['address'],
          time: item['work_time'],
          extra: item['extra'],
          latitude: item['latitude'],
          longitude: item['longitude']));
      markers.add(Marker(
          point: LatLng(item['latitude'], item['longitude']),
          width: 60,
          height: 60,
          child: const Icon(Icons.location_pin, color: AppColors.richPurplishRedColor,)));
    }
    ref.read(addressesProvider.notifier).state = addressWidgets;
    ref.read(markersProvider.notifier).state = markers;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    getRestaurants(ref);
    return const CustomSliverAppBar(
      widgets: [
        AddressesWidgets()
      ],
    );
  }
}

class AddressesWidgets extends ConsumerWidget {
  const AddressesWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressWidgets = ref.watch(addressesProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          const AnimatedTextWidget(text: 'Производим сытость и радость'),
          const SizedBox(height: 20),
          const HeaderWidget(name: 'Наши рестораны'),
        if (addressWidgets.isNotEmpty) ...[
          const AddressesWidget(),
          const SizedBox(height: 40),
          const Text('Ждем вас в гости', style: AppTextStyles.heading_2,),
          const SizedBox(height: 20),
          const MapWidget(),
          const SizedBox(height: 20),
          const InfoWidget(),
          const SizedBox(height: 20),
          const ButtonWidget(
            buttonText: 'Обратная связь',
            nextScreen: 'feedback',
          ),
          const SizedBox(height: 20),
        ] else
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
