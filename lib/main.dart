import 'package:Tasbih/layouts/hadith_details.dart';
import 'package:Tasbih/layouts/home.dart';
import 'package:Tasbih/layouts/splash.dart';
import 'package:Tasbih/layouts/sura_details.dart';
import 'package:Tasbih/provider/my_provider.dart';
import 'package:Tasbih/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) {
        var provider = MyProvider();
        provider.loadThemeData();
        return provider;
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        initialRoute: SplashScreen.routeName,
        debugShowCheckedModeBanner: false,
        themeMode: provider.myTheme,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          SuraDetails.routeName: (context) => const SuraDetails(),
          HadithDetails.routeName: (context) => const HadithDetails(),
        },
      ),
    );
  }
}
