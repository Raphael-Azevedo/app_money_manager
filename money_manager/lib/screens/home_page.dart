import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';
import '../components/home_card.dart';
import '../components/list_recent_transactions.dart';
import '../utils/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeCard(),
            RecentTransactions(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(AppRoutes.transactions);
        },
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
