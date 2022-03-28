import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_automation/screens/dashboard_screen.dart';
import 'package:home_automation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
      },
    );
  }
}
