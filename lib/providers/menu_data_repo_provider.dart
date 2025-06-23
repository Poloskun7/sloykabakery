import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/data/repositories/menu_data_repo.dart';
import 'package:sloykabakery/providers/api_service_provider.dart';

final menuDataRepoProvider = Provider<MenuDataRepo>((ref) {
  return MenuDataRepo(ref.read(apiServiceProvider),);
});