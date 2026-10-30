import 'package:mocktail/mocktail.dart';
import 'package:sloykabakery/core/network/api_service.dart';

import '../models/test_exceptions.dart';

class MockApiService extends Mock implements ApiService {
  void mockMenuDataNoInternetError() {
    when(() => fetchMenuData()).thenThrow(createTestNoInternetException());
  }

  void mockMenuDataApiTimeoutError() {
    when(() => fetchMenuData()).thenThrow(createTestApiTimeoutException());
  }

  void mockMenuDataServerError() {
    when(() => fetchMenuData()).thenThrow(createTestApiException());
  }

  void mockCafesNoInternetError() {
    when(() => fetchCafes()).thenThrow(createTestNoInternetException());
  }

  void mockCafesApiTimeoutError() {
    when(() => fetchCafes()).thenThrow(createTestApiTimeoutException());
  }

  void mockCafesServerError() {
    when(() => fetchCafes()).thenThrow(createTestApiException());
  }
}
