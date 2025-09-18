import 'package:mocktail/mocktail.dart';
import 'package:sloykabakery/data/models/api_menu_data.dart';
import 'package:sloykabakery/data/services/api_service.dart';

import '../models/test_exceptions.dart';

class MockApiService extends Mock implements ApiService {

  void mockSuccessResponse(ApiMenuData data) {
    when(() => fetchMenuData()).thenAnswer((_) async => data);
  }

  void mockNoInternetError() {
    when(() => fetchMenuData()).thenThrow(createTestNoInternetException());
  }

  void mockApiTimeoutError() {
    when(() => fetchMenuData()).thenThrow(createTestApiTimeoutException());
  }

  void mockServerError() {
    when(() => fetchMenuData()).thenThrow(
      createTestApiException(),
    );
  }

  void mockValidationError() {
    when(() => fetchMenuData()).thenThrow(createTestValidationException());
  }
}