import 'package:sloykabakery/features/cafes/domain/cafe.dart';

List<Cafe> createTestCafes() {
  return <Cafe>[
    Cafe(
      id: 1,
      address: 'Mockoy',
      workTime: '10am : 6pm',
      extra: '...',
      latitude: 1.00,
      longitude: 2.00,
    ),
    Cafe(
      id: 2,
      address: 'Mockoy',
      workTime: '10am : 6pm',
      extra: '...',
      latitude: 1.00,
      longitude: 2.00,
    ),
  ];
}
