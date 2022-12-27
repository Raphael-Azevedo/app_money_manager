import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';
import '../components/home_card.dart';
import '../components/list_recent_transactions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeCard(),
            RecentTransactions(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
