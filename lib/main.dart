import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task_flutter/internal/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
