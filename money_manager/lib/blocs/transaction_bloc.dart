import 'package:bloc/bloc.dart';
import 'package:money_manager/blocs/transaction_events.dart';
import 'package:money_manager/blocs/transaction_state.dart';
import 'package:money_manager/repositories/transactions_repository.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final _transactionRepo = TransactionsRepository();

  TransactionBloc() : super(TransactionInitialState()) {
    on<LoadTransactionEvent>(((event, emit) => emit(TransactionSuccessState(
        transactions: _transactionRepo.loadTransactions()))));
  }
}
