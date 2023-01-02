import 'package:flutter/material.dart';

import '../components/bottom_navigation.dart';
import '../components/chart_bar.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 149, 33, 136),
                          Color.fromARGB(255, 193, 137, 200),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            ),
                            Text(
                              'Adicionar Entrada',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 149, 33, 136),
                          Color.fromARGB(255, 193, 137, 200),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(35.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                            ),
                            Text(
                              'Adicionar Gasto',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const ChartBar(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
