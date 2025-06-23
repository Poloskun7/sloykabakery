import 'package:sloykabakery/domain/models/cafe.dart';

class ApiCafe {
  final String address;
  final String time;
  final String extra;
  final double latitude;
  final double longitude;

  ApiCafe({required this.address, required this.time, required this.extra, required this.latitude, required this.longitude});

  factory ApiCafe.fromJson(Map<String, dynamic> json) {
    return ApiCafe(
      address: json['address'],
      time: json['time'],
      extra: json['extra'],
      latitude: json['latitude'],
      longitude: json['longitude']
    );
  }

  Cafe toDomain() {
    return Cafe(
      address: address,
      time: time,
      extra: extra,
      latitude: latitude,
      longitude: longitude
    );
  }
}