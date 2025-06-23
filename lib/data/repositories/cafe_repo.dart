import 'package:sloykabakery/data/services/api_service.dart';
import 'package:sloykabakery/data/models/api_cafe.dart';
import 'package:sloykabakery/domain/models/cafe.dart';

class CafeRepo {
  final ApiService apiService;

  CafeRepo(this.apiService);

  // Future<List<Cafe>> getCafes() async {
  //   final List<ApiCafe> apiCafes = await apiService.fetchCafes();

  //   return apiCafes.map((apiCafe) => apiCafe.toDomain()).toList();
  // }
}
