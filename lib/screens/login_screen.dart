import 'package:cookpad_application/screens/register_screen.dart';
import 'package:cookpad_application/screens/widget/bottom_navigation.dart';
import 'package:cookpad_application/screens/widget/button2custom.dart';
import 'package:cookpad_application/screens/widget/button_custom.dart';
import 'package:cookpad_application/screens/widget/textfield_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({super.key, required this.showRegisterPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(),
  //     password: _passwordController.text.trim(),
  //   );
  // }

  Future signUserIn() async {
    // loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Email tidak terdaftar'),
          content: Text('Mohon periksa kembali email dan password Anda.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Password Salah'),
        );
      },
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  // }

  void _handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // if (email.isEmpty || password.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Mohon isi email dan password.'),
    //     ),
    //   );
    //   return;
    // }

    // if (email == "emma@gmail.com" && password == "emma123") {
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (_) => BottomNavigation()),
    //       (route) => false);
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Login Gagal'),
    //       content: Text('Mohon periksa kembali email dan password Anda.'),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.pop(context),
    //           child: Text('Tutup'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Login Page",
      //       style: TextStyle(
      //           color: Colors.grey[850], fontWeight: FontWeight.bold)),
      // ),
      backgroundColor: Color(0xFFF8F6F2),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // row ke 1
                Column(
                  children: [
                    Text(
                      "Masuk",
                      style: TextStyle(
                        color: Color.fromRGBO(74, 74, 74, 1),
                        fontWeight: FontWeight.w900,
                        fontSize: 27.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "dari jutaan resep yang ada",
                      style: TextStyle(
                          fontSize: 16.0, color: Color.fromRGBO(74, 74, 74, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),

                // row ke 2
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldCustom(
                        ctrl: _emailController,
                        hint: "Email",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        ctrl: _passwordController,
                        hint: "Password",
                        icon: Icons.lock_outline,
                        isObscureText: true,
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                ),

                // row ke 3
                ButtonCustom(
                  onPressed: signUserIn,
                  label: "Masuk",
                  backgroundColor: Color.fromRGBO(241, 158, 75, 1),
                  foregroundColor: Colors.white,
                ),
                const SizedBox(height: 20),

                // row ke 4
                Text(
                  "Lupa kata sandi kamu?",
                  style: TextStyle(
                    color: Color.fromRGBO(74, 74, 74, 1),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 25),

                // row ke 5 - divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("atau"),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // row ke 6
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Button2Custom(
                      onPressed: () {},
                      label: "Masuk dengan Facebook",
                      imagePath: "assets/images/facebook.png",
                    ),
                    const SizedBox(height: 10),
                    Button2Custom(
                      onPressed: () {},
                      label: "Masuk dengan Google",
                      imagePath: "assets/images/google.png",
                    ),
                    const SizedBox(height: 10),
                    Button2Custom(
                      onPressed: () {},
                      label: "Masuk dengan Apple",
                      imagePath: "assets/images/apple_logo.png",
                    ),
                    const SizedBox(height: 20)
                  ],
                ),

                // row ke 7
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun?"),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.grey[850],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: widget.showRegisterPage,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
