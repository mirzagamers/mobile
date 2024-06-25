import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:karyawanku_apps/auth_service.dart';
import 'package:karyawanku_apps/home_screen.dart';
import 'package:karyawanku_apps/login_screen.dart';
import 'package:karyawanku_apps/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  @override
  Widget build(BuildContext context) {
    const textFieldStyle = TextStyle(color: Colors.black);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/login_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  "Buat Akun",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                const SizedBox(height: 30),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _name,
                        labelText: "Nama Pengguna",
                        hintText: "Masukkan Nama Pengguna",
                        style: textFieldStyle,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _email,
                        labelText: "Email",
                        hintText: "Masukkan Email",
                        style: textFieldStyle,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _password,
                        labelText: "Kata Sandi",
                        hintText: "Masukkan Kata Sandi",
                        style: textFieldStyle,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    label: "Daftar",
                    onPressed: _signup,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => goToLogin(context),
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          color: Color.fromARGB(255, 144, 210, 238),
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required TextStyle style,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        style: style,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Silakan masukkan $labelText';
          }
          return null;
        },
      ),
    );
  }

  void goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  void goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );

  void _signup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final user = await _auth.createUserWithEmailAndPassword(
          _email.text, _password.text, _name.text);
      if (user != null) {
        log("Pengguna berhasil dibuat");
        _saveUserName(_name.text);
        goToHome(context);
      }
    } catch (e) {
      log("Pendaftaran gagal: $e");
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }
}
