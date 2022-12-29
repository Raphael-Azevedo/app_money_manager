import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/blocs/transaction_bloc.dart';
import 'package:money_manager/blocs/transaction_state.dart';

import '../blocs/transaction_events.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
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
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Transações Recentes',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 10),
          BlocBuilder<TransactionBloc, TransactionState>(
            bloc: bloc,
            builder: ((context, state) {
              if (state is TransactionInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TransactionSuccessState) {
                final transactionList = state.transactions;
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: transactionList.length,
                    itemBuilder: ((context, index) => Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35))),
                          child: ListTile(
                            leading: (transactionList[index].value > 0)
                                ? const Icon(
                                    Icons.arrow_circle_up_sharp,
                                    color: Colors.green,
                                    size: 50,
                                  )
                                : const Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Colors.red,
                                    size: 50,
                                  ),
                            title: Text(transactionList[index].title),
                            subtitle: Text(transactionList[index].description),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'R\$ ${transactionList[index].value.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: (transactionList[index].value > 0)
                                          ? Colors.green
                                          : Colors.red),
                                ),
                                Text(DateFormat('dd/MM/yyyy')
                                    .format(transactionList[index].date)),
                              ],
                            ),
                          ),
                        )),
                  ),
                );
              }
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
