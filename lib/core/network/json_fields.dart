import '../exceptions.dart';

// Validate at the API boundary so malformed data never reaches Hive or widgets.
Map<String, dynamic> jsonObject(Object? value, String field) {
  if (value is Map<String, dynamic>) return value;
  throw DataValidationException('Expected an object', field: field);
}

T jsonField<T>(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is T) return value;
  throw DataValidationException('Invalid field type', field: key);
}

T? optionalJsonField<T>(Map<String, dynamic> json, String key) {
  if (json[key] == null) return null;
  return jsonField<T>(json, key);
}

double jsonCoordinate(Map<String, dynamic> json, String key, double limit) {
  final value = jsonField<num>(json, key).toDouble();
  if (value.isFinite && value.abs() <= limit) return value;
  throw DataValidationException('Invalid coordinate', field: key);
}
