import 'package:flutter/material.dart';
import '../themes/theme.dart';
import '../themes/dimens.dart';

class StartupApp extends StatefulWidget {
  final Future<void> Function() initialize;
  final Widget child;
  final bool configured;
  const StartupApp({
    super.key,
    required this.initialize,
    required this.child,
    required this.configured,
  });

  @override
  State<StartupApp> createState() => _StartupAppState();
}

class _StartupAppState extends State<StartupApp> {
  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _initialize();
  }

  Future<void> _initialize() async {
    if (widget.configured) await widget.initialize();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
    future: _initialization,
    builder: (context, snapshot) {
      if (widget.configured &&
          snapshot.connectionState == ConnectionState.done &&
          !snapshot.hasError) {
        return widget.child;
      }
      final failed = snapshot.hasError || !widget.configured;
      return MaterialApp(
        title: 'Слойка',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppDimens.space2xl),
                child: failed
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.configured
                                ? 'Не удалось открыть данные'
                                : 'Сборка не настроена',
                            style: AppTextStyles.heading,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppDimens.spaceLg),
                          Text(
                            widget.configured
                                ? 'Проверьте свободное место и попробуйте снова. Если ошибка повторяется, потребуется проверка локальных данных. Избранное не удалено.'
                                : 'В этой сборке отсутствует настройка подключения к серверу.',
                            textAlign: TextAlign.center,
                          ),
                          if (widget.configured) ...[
                            const SizedBox(height: AppDimens.spaceLg),
                            FilledButton(
                              onPressed: () => setState(() {
                                _initialization = _initialize();
                              }),
                              child: const Text('Повторить'),
                            ),
                          ],
                        ],
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      );
    },
  );
}
