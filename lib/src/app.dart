import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:funda_assignment/src/config/app_theme.dart';
import 'package:funda_assignment/src/infrastructure/data_controller.dart';
import 'package:funda_assignment/src/presentation/detail_page.dart';
import 'package:funda_assignment/src/presentation/search_page.dart';
import 'package:funda_assignment/src/providers/object_detail_provider.dart';
import 'package:funda_assignment/src/providers/search_provider.dart';
import 'package:provider/provider.dart';

class FundaAssignmentApp extends StatelessWidget {
  const FundaAssignmentApp({
    super.key,
    this.apiClient,
  });

  final Dio? apiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'com.mdvdw.funda_assignment',
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
      routes: {
        '/': (_) => ChangeNotifierProvider(
              create: (_) => SearchProvider(DataController(apiClient)),
              child: const SearchPage(),
            ),
        DetailPage.route: (context) => ChangeNotifierProvider(
              create: (_) {
                // The search request is started here. This way the details
                // page only needs to know how to render the data it's given.
                final id =
                    ModalRoute.of(context)!.settings.arguments! as String;
                return ObjectDetailProvider(DataController(apiClient))
                  ..fetchObject(id);
              },
              child: const DetailPage(),
            ),
      },
    );
  }
}
