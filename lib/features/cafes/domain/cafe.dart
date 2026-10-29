import 'package:hive/hive.dart';

part 'cafe.g.dart';

@HiveType(typeId: 3)
class Cafe {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String workTime;

  @HiveField(3)
  final String extra;

  @HiveField(4)
  final double latitude;

  @HiveField(5)
  final double longitude;

  Cafe({
    required this.id,
    required this.address,
    required this.workTime,
    required this.extra,
    required this.latitude,
    required this.longitude,
  });
}
