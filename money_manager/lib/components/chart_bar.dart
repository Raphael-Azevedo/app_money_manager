import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/transaction_bloc.dart';
import '../blocs/transaction_events.dart';
import '../blocs/transaction_state.dart';
import '../models/transaction.dart';
import 'chart_bar_item.dart';

class ChartBar extends StatefulWidget {
  const ChartBar({super.key});

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  late final TransactionBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = TransactionBloc();
    bloc.add(LoadTransactionEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  List<Transaction> recentTransactions = [];

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: 30 * (index + 1)),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {
        'month': DateFormat.MMM().format(weekDay),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
          if (state is TransactionInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccessState) {
            // recentTransactions = state.transactions;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactions.map((tr) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBarItem(
                    tr['month'] as String,
                    tr['value'] as double,
                    _weekTotalValue == 0
                        ? 0
                        : (tr['value'] as double) / _weekTotalValue,
                  ),
                );
              }).toList(),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
