import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/internal/application.dart';
import 'package:test_task_flutter/internal/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('ru'),
        ],
        path: 'assets/strings',
        fallbackLocale: const Locale('ru'),
        child: const Application(),
      ),
    );
  });
}
