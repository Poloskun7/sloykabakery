import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/domain/models/menu_data.dart';
import 'package:sloykabakery/providers/menu_data_repo_provider.dart';

final menuDataProvider = FutureProvider<MenuData>((ref) async{
  final repository = ref.watch(menuDataRepoProvider);
  return repository.getMenuData();
});