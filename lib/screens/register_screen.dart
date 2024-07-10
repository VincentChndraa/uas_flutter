import 'package:cookpad_application/screens/login_screen.dart';
import 'package:cookpad_application/screens/widget/button_custom.dart';
import 'package:cookpad_application/screens/widget/textfield_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterScreen({super.key, required this.showLoginPage});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F6F2),
      ),
      backgroundColor: Color(0xFFF8F6F2),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Section 1 - Title and Subtitle
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Daftar dengan Email",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w900,
                        fontSize: 27.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Silahkan masukkan username, email dan kata sandi",
                      style: TextStyle(
                          fontSize: 16.0, color: Color.fromRGBO(74, 74, 74, 1)),
                    )
                  ],
                ),

                // Section 2 - Input
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldCustom(
                        ctrl: _usernameController,
                        hint: "Nama Pengguna",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        ctrl: _emailController,
                        hint: "Email",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        ctrl: _passwordController,
                        hint: "Kata Sandi",
                        icon: Icons.lock_outline,
                        isObscureText: true,
                      ),
                      const SizedBox(height: 15),
                      TextFieldCustom(
                        ctrl: _confirmPasswordController,
                        hint: "Konfirmasi Kata Sandi",
                        icon: Icons.lock_outline,
                        isObscureText: true,
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),

                // Section 3 - Button
                ButtonCustom(
                  onPressed: signUp,
                  label: "Buat Akun",
                  backgroundColor: Color.fromRGBO(241, 158, 75, 1),
                  foregroundColor: Colors.white,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun?"),
                    SizedBox(width: 4.0),
                    GestureDetector(
                      child: Text(
                        'Login Sekarang',
                        style: TextStyle(
                          color: Colors.grey[850],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: widget.showLoginPage,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
