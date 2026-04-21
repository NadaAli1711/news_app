import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/utils/app_theme.dart';
import 'package:news_app/ui/screens/details_screen.dart';
import 'package:news_app/ui/screens/home_screen.dart';
import 'package:news_app/ui/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/providers/articles_provider.dart';
import 'core/providers/search_provider.dart';
import 'core/providers/source_provider.dart';
import 'core/providers/theme_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),

      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => ArticlesProvider()),
          ChangeNotifierProvider(create: (_) => SourceProvider()),

        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context) => HomeScreen() ,
        AppRoutes.detailsScreen: (context) => DetailsScreen() ,
        AppRoutes.searchScreen: (context) => ChangeNotifierProvider(create: (context) => SearchProvider(),child: SearchScreen(),),
      },
      themeMode: themeProvider.themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
    );
  }
}
