import 'package:airplane_app/cubit/transaction_cubit.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text('Anda belum memiliki transaksi'),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(top: 30, bottom: 100),
              child: ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                itemBuilder: (context, index) {
                  return TransactionCard(state.transactions[index]);
                },
              ),
            );
          }
        }
        return Center(
          child: Text('Transaction Page '),
        );
      },
    );
  }
}
