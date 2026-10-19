import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/buy_screen.dart';
import 'screens/sell_screen.dart';
import 'screens/developer_screen.dart';
import 'screens/investor_screen.dart';
import 'screens/apls_screen.dart';
import 'screens/buldls_screen.dart';
import 'screens/landls_screen.dart';

void main() {
  runApp(const HomeLandBdApp());
}

class HomeLandBdApp extends StatelessWidget {
  const HomeLandBdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeLandBd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF5B6FD8),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5B6FD8),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/buy': (context) => const BuyScreen(),
        '/sell': (context) => const SellScreen(),
        '/developer': (context) => const DeveloperScreen(),
        '/investor': (context) => const InvestorScreen(),
        '/apartments': (context) => const AplsScreen(),
        '/buildings': (context) => const BuldlsScreen(),
        '/land': (context) => const LandlsScreen(),
      },
    );
  }
}