import 'package:flutter/material.dart';
import 'package:saarthi_for_drivers/screens/auth/forgot_password_screen.dart';
import 'package:saarthi_for_drivers/screens/auth/login_screen.dart';
import 'package:saarthi_for_drivers/screens/auth/register_screen.dart';
import 'package:saarthi_for_drivers/screens/landing/home_screen.dart';
import 'package:saarthi_for_drivers/screens/onboarding_screen.dart';
import 'package:saarthi_for_drivers/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/homescreen': (context) =>  HomeScreen(),
      },
    );
  }
}
