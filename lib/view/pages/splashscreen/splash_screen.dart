import 'package:easybuy_admin_app/services/auth_service/auth_sevice.dart';
import 'package:easybuy_admin_app/view/core/constants.dart';
import 'package:easybuy_admin_app/view/pages/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  static const routename = '/Splash';

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> checkUserSignIn() async {
      await Future.delayed(const Duration(milliseconds: 2000));
      
      bool signIn= await AuthService().adminSignIn(email: email, password: password);
      if(signIn){
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('error');
      }
    }
    checkUserSignIn();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'asset/images/adminsplash.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
