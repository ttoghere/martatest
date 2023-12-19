import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';

class Giderler extends StatelessWidget {
  final VoidCallback bottomSheet;
  const Giderler({
    Key? key,
    required this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<dynamic>>(
          future: context.read<ExpensesProvider>().getExpenses(12),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<dynamic> expenses = snapshot.data ?? [];

              return ExpenseListWidget(expenses);
            }
          },
        ),
        Positioned(
          right: 30,
          bottom: 110,
          child: IconButton(
            padding: const EdgeInsets.all(15),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF5850EC),
            ),
            onPressed: bottomSheet,
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}

class ExpenseListWidget extends StatelessWidget {
  final List<dynamic> expenses;

  const ExpenseListWidget(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        var expense = expenses[index];
        return ListTile(
          title: Text(expense['description']),
        );
      },
    );
  }
}
