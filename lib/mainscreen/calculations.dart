
import 'package:hive/hive.dart';

import '../expensesScreen/expenses_model.dart';

final box = Hive.box<Expense_model>('expenses');
  double totalSum = 0;
  double cal() {
    var box = Hive.box<Expense_model>('expenses');
    double totalSum = 0;
    for (var i = 0; i < box.length; i++) {
      Expense_model expense = box.getAt(i)!;
      totalSum += expense.amount;
    }
    return totalSum;
  }
