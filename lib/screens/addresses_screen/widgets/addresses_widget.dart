import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/screens/addresses_screen/addresses_screen.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class AddressesWidget extends ConsumerWidget {
  const AddressesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressesProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...addresses,
        ],
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  final String address;
  final String time;
  final String extra;
  final double latitude;
  final double longitude;

  const AddressWidget(
      {super.key,
      required this.address,
      required this.time,
      required this.extra,
      required this.latitude,
      required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border:
                Border.all(color: const Color.fromARGB(255, 233, 229, 231))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                extra,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(time, style: const TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}
