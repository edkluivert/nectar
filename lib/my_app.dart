
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nectar/config/thema.dart';
import 'package:nectar/routes/app_pages.dart';
import 'package:nectar/routes/app_routes.dart';

import 'config/palette.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Fixing App Orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: nPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: nPrimaryColor,
        statusBarIconBrightness: Brightness.dark);
   SystemChrome.setSystemUIOverlayStyle(dark);

    return ScreenUtilInit(
      designSize: Size(414,896),
      builder: ()=> GetMaterialApp(
        //title: 'Flutter Demo',
        theme: theme(),
        initialRoute: AppRoutes.INTRO,
        getPages: AppPages.list,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}