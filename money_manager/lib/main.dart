import 'package:flutter/material.dart';
import 'package:money_manager/screens/home_page.dart';
import 'package:money_manager/screens/transaction_page.dart';
import 'package:money_manager/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.purple,
              secondary: const Color.fromRGBO(96, 126, 234, 100))),
      routes: {
        AppRoutes.home: ((ctx) => const HomePage()),
        AppRoutes.transactions: ((ctx) => const TransactionPage()),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
