import 'package:money_manager/models/transaction.dart';

abstract class TransactionState {
  List<Transaction> transactions;

  TransactionState({required this.transactions});
}

class TransactionInitialState extends TransactionState {
  TransactionInitialState() : super(transactions: []);
}

class TransactionSuccessState extends TransactionState {
  TransactionSuccessState({required List<Transaction> transactions})
      : super(transactions: transactions);
}
