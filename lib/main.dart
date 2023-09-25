import 'package:easybuy_admin_app/view/core/colors.dart';
import 'package:easybuy_admin_app/view/pages/routes/routes.dart';
import 'package:easybuy_admin_app/view/pages/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    khieght = MediaQuery.of(context).size.height;
    kwidth = MediaQuery.of(context).size.width;
    return  MaterialApp(
      title: 'EaSyBuY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: SplashScreen.routename,
      onGenerateRoute: RouteProviders.onGenerateRoute,
    );
  }
}

