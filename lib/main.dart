import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/api_config.dart';
import 'core/routing/router.dart';
import 'core/themes/theme.dart';
import 'core/widgets/startup_app.dart';
import 'features/cafes/domain/cafe.dart';
import 'features/menu/domain/category.dart';
import 'features/menu/domain/menu_data.dart';
import 'features/menu/domain/product.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks([
      'Golos Text',
    ], await rootBundle.loadString('assets/fonts/OFL.txt'));
  });

  Hive.registerAdapter(MenuDataAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(CafeAdapter());
  runApp(
    StartupApp(
      configured: ApiConfig.token.isNotEmpty,
      initialize: _initialize,
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

Future<void> _initialize() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Слойка',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      routerConfig: router,
    );
  }
}
