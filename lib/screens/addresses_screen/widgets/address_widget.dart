import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String address;
  final String landmark;
  final String time;

  const AddressWidget({super.key, required this.address, required this.landmark, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Container(
        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              Text(landmark, style: const TextStyle(fontSize: 16, color: Colors.grey),),
              const SizedBox(height: 20),
              Text(time, style: const TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}