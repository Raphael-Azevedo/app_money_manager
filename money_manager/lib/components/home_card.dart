import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/transaction_bloc.dart';
import '../blocs/transaction_events.dart';
import '../blocs/transaction_state.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late final TransactionBloc blocTransaction;
  late final double total;
  double valueTotal = 0;
  double valueEntrance = 0;
  double valueCost = 0;

  @override
  void initState() {
    super.initState();
    blocTransaction = TransactionBloc();
    blocTransaction.add(LoadRecentTransactionEvent());
  }

  @override
  void dispose() {
    blocTransaction.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: BlocBuilder<TransactionBloc, TransactionState>(
          bloc: blocTransaction,
          builder: ((context, state) {
            if (state is TransactionInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionSuccessState) {
              final transactionList = state.transactions;
              for (var e in transactionList) {
                valueTotal = e.value + valueTotal;
                if (e.value > 0) {
                  valueEntrance += e.value;
                } else {
                  valueCost -= e.value;
                }
              }
              return Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                        child: Text(
                          'R\$ ${valueTotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Saldo total disponível após efetuado os débitos',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green),
                        width: 180,
                        child: ListTile(
                          leading: const Icon(Icons.download,
                              color: Colors.white, size: 40),
                          title: const Text(
                            'Entradas',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            valueEntrance.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red),
                        width: 180,
                        child: ListTile(
                          leading: const Icon(Icons.upload,
                              color: Colors.white, size: 40),
                          title: const Text(
                            'Gastos',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            valueCost.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container();
          })),
    );
  }
}
