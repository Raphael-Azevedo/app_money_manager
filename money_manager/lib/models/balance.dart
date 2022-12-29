import 'package:money_manager/models/transaction.dart';

class Balance {
  double saldo;
  List<Transaction> transacoes;

  Balance({this.saldo = 0, this.transacoes = const []});

  void adicionarDinheiro(double valor) {
    saldo += valor;
  }

  void pagarConta(double value, String descricao, String title) {
    if (saldo >= value) {
      saldo -= value;
      transacoes
          .add(Transaction(value: value, title: title, description: descricao));
    } else {
      throw Exception('Saldo insuficiente para realizar essa transação');
    }
  }
}
