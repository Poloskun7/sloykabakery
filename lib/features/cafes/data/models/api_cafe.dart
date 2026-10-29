import 'package:sloykabakery/features/cafes/domain/cafe.dart';

import '../../../../core/network/json_fields.dart';

class ApiCafe {
  final int id;
  final String address;
  final String workTime;
  final String extra;
  final double latitude;
  final double longitude;

  ApiCafe({
    required this.id,
    required this.address,
    required this.workTime,
    required this.extra,
    required this.latitude,
    required this.longitude,
  });

  factory ApiCafe.fromJson(Map<String, dynamic> json) {
    return ApiCafe(
      id: jsonField<int>(json, 'id'),
      address: jsonField<String>(json, 'address'),
      workTime: jsonField<String>(json, 'work_time'),
      extra: jsonField<String>(json, 'extra'),
      latitude: jsonCoordinate(json, 'latitude', 90),
      longitude: jsonCoordinate(json, 'longitude', 180),
    );
  }

  Cafe toDomain() {
    return Cafe(
      id: id,
      address: address,
      workTime: workTime,
      extra: extra,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
