import 'package:sloykabakery/core/exceptions.dart';

NoInternetException createTestNoInternetException() =>
    const NoInternetException();

ApiTimeoutException createTestApiTimeoutException() =>
    const ApiTimeoutException();

ApiException createTestApiException() =>
    const ApiException('Test server error', statusCode: 500);
