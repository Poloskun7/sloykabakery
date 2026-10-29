import 'package:sloykabakery/features/cafes/data/models/api_cafe.dart';

List<ApiCafe> createTestApiCafes() {
  return <ApiCafe>[
    ApiCafe(
      id: 1,
      address: 'Mockoy',
      workTime: '10am : 6pm',
      extra: '...',
      latitude: 1.00,
      longitude: 2.00,
    ),
    ApiCafe(
      id: 2,
      address: 'Mockoy',
      workTime: '10am : 6pm',
      extra: '...',
      latitude: 1.00,
      longitude: 2.00,
    ),
  ];
}
