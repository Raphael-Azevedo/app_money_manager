import 'package:money_manager/models/transaction.dart';

class TransactionsRepository {
  final List<Transaction> _transactions = [];

  List<Transaction> loadTransactions() {
    _transactions.addAll([
      Transaction(
          value: -191.90,
          title: 'Conta de luz',
          description: 'Conta de luz do mês de dezembro'),
      Transaction(
          value: 1200,
          title: 'Pagamento Nathalie',
          description: 'Pagamento dia 30 de Nathalie'),
      Transaction(
          value: 930,
          title: 'Pagamento Raphael',
          description: 'Pagamento dia 30 de Raphael'),
      Transaction(
          value: -112.55,
          title: 'Conta de água',
          description: 'Conta de agua do mês de dezembro'),
      Transaction(
          value: -112.55,
          title: 'Conta de água',
          description: 'Conta de agua do mês de dezembro'),
    ]);

    return _transactions;
  }

  List<Transaction> loadRecentTransactions() {
    loadTransactions();
    return _transactions
        .where((e) => e.date.month == DateTime.now().month)
        .toList();
  }
}
