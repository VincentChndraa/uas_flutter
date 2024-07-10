import 'package:cookpad_application/screens/login_screen.dart';
import 'package:cookpad_application/screens/main_page.dart';
import 'package:cookpad_application/screens/widget/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print("Hasil : ${snapshot.hasData}");
            return BottomNavigation();
          } else {
            return MainPage();
          }
        },
      ),
    );
  }
}
