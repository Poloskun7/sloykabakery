import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sloykabakery/providers/menu_data_repo_provider.dart';
import 'package:sloykabakery/ui/menu/view_models/menu_view_model.dart';

final menuViewModelProvider = StateNotifierProvider<MenuViewModel, MenuState>(
  (ref) => MenuViewModel(
    repository: ref.read(menuDataRepoProvider),
  ),
);
