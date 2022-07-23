import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:funda_assignment/src/config/app_theme.dart';
import 'package:funda_assignment/src/infrastructure/data_controller.dart';
import 'package:funda_assignment/src/presentation/detail_page.dart';
import 'package:funda_assignment/src/presentation/search_page.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:funda_assignment/src/providers/search_provider.dart';
import 'package:funda_assignment/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('nl', ''),
      ],
      theme: appTheme,
      darkTheme: ThemeData.dark(),
      themeMode: settingsController.themeMode,
      routes: {
        '/': (_) => ChangeNotifierProvider(
              create: (_) => SearchProvider(DataController()),
              child: const SearchPage(),
            ),
        DetailPage.route: (context) => ChangeNotifierProvider(
              create: (_) {
                final id =
                    ModalRoute.of(context)!.settings.arguments! as String;
                return ObjectDetailProvider(DataController())..fetchObject(id);
              },
              child: const DetailPage(),
            ),
      },
    );
  }
}
