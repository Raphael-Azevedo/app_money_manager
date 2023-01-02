import 'package:flutter/material.dart';
import 'package:money_manager/utils/app_routes.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                },
                icon: const Icon(Icons.home),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                 
                },
                icon: const Icon(Icons.payment),
                color: Colors.white,
              ),
              const SizedBox(
                width: 24,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.pie_chart),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bar_chart_outlined),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
