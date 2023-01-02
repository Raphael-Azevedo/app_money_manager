import 'package:flutter/material.dart';

class ChartBarItem extends StatelessWidget {
  const ChartBarItem(this.label, this.value, this.percentage, {super.key});

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
            height: 15,
            child: FittedBox(
              child: Text(
                value.toStringAsFixed(2),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            width: 15,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(121, 158, 158, 158),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 15,
            child: FittedBox(
              child: Text(
                label,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      );
    });
  }
}
