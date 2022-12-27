import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: const BoxDecoration(
        color: Color.fromARGB(235, 230, 180, 247),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      width: 350, //80 % da largura do cel
      child: Column(
        children: const [
          SizedBox(height: 20),
          Text(
            'Transações Recentes',
            textAlign: TextAlign.left,
          ),
          // ListView.builder(itemBuilder: itemBuilder)
        ],
      ),
    );
  }
}
