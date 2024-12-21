import 'package:flutter/material.dart';
import 'package:user2/screens/loyalty_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoyaltyDashboardScreen(),
    );
  }
}
