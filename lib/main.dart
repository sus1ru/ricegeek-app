import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rice_geek/blocs/provider.dart';
import 'package:rice_geek/pages/auth/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:rice_geek/core/res/color.dart';
import 'package:rice_geek/core/routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'RiceGeek',
        debugShowCheckedModeBanner: false,
        theme: AppColors.getTheme,
        initialRoute: Routes.landingPage,
        onGenerateRoute: RouterGenerator.generateRoutes,
      );
    });
  }
}
