import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rice_geek/blocs/provider.dart';
import 'package:rice_geek/pages/auth/login_screen.dart';
import 'package:rice_geek/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.hasData){
          return const HomeScreen();
        }
        return Provider(child: const LoginScreen());
      },
    );
  }
}
