import 'package:ecuaventure/src/pages/login_page.dart';
import 'package:ecuaventure/src/providers/provider_color.dart';
import 'package:ecuaventure/src/providers/provider_menu.dart';
//import 'package:ecuaventure/src/pages/menu_page.dart';
import 'package:ecuaventure/src/providers/provider_moto.dart';
import 'package:ecuaventure/src/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ecuaventure/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false, //PARA QUITAR EL DEBUG DE LA APP
        title: 'ecuadventure',
        home: LoginPage(),
      ),
    );*/
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return FutureBuilder<bool>(
        future: mainProvider.getPreferences(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScreenUtilInit(
              
                designSize: const Size(360, 690),
                builder: () => MaterialApp(
                  supportedLocales:L10n.all,
                  // ignore: prefer_const_literals_to_create_immutables
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                    debugShowCheckedModeBanner: false,
                    title: 'ecuadventure',
                    theme: AppTheme.themeData(mainProvider.mode),
                    home: const LoginPage()));
          }
          return const SizedBox.square(
              dimension: 50.0, child: CircularProgressIndicator());
        });
  }
}
