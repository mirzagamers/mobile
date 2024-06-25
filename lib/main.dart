import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
// Import layar login

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AIzaSyADdBf2Kl0ibuwiWz_EMYloLvPKl2cQBjc", // paste your api key here
      appId:
          "1:320442952235:android:952018960996d686d5986e", //paste your app id here
      messagingSenderId: "320442952235", //paste your messagingSenderId here
      projectId: "karyawan1-b10c6", //paste your project id here
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),

      // Mulai dengan layar login
    );
  }
}
