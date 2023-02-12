import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:knowshare_app/knowshare/core/theme.dart';
import 'package:knowshare_app/knowshare/provider/syscheck.dart';
import 'package:knowshare_app/knowshare/routes/homescreen.dart';
import 'package:knowshare_app/knowshare/routes/splash.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:theme_provider/theme_provider.dart';

import 'firebase_options.dart';
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder:(context)=>ThemeProvider(
        themes: [
          AppTheme(id: "dark", data: AppThemes.darkTheme(context), description: ""),
          AppTheme(id: "light", data: AppThemes.lightTheme(context), description: ""),
        ],
      child: ThemeConsumer(
        child: Builder(
          builder:(context)=>MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=>sysCheckProvider())
            ],
            child:ResponsiveSizer(

              builder:(context,orientation,deviceType)=> MaterialApp(
                theme: ThemeProvider.themeOf(context).data,
                  useInheritedMediaQuery: true,
                  initialRoute: splashScreenRoute.routeName,
                  routes: {
                    splashScreenRoute.routeName:(context)=>splashScreenRoute(),
                    homeScreenRoute.routeName:(context)=>homeScreenRoute(),
                  },
                ),
            ),
            ),
        ),
      ),
  ),
    ),
  );
}

