import 'package:sloykabakery/core/exceptions/exceptions.dart';

NoInternetException createTestNoInternetException() => const NoInternetException();

ApiTimeoutException createTestApiTimeoutException() => const ApiTimeoutException();

ApiException createTestApiException() => const ApiException(
  'Test server error',
  statusCode: 500,
);

DataValidationException createTestValidationException() =>
  const DataValidationException('Test validation error');