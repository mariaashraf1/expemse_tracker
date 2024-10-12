import 'package:hive/hive.dart';

import '../expensesScreen/expenses_model.dart';

part 'budget_model.g.dart';

@HiveType(typeId: 3)
class CategoryBudget extends HiveObject {
  @HiveField(0)
  final String category;
  @HiveField(1)
  double budgetAmount;

  CategoryBudget(this.category, this.budgetAmount);

  static List<String> extractUniqueCategories(List<Expense_model> expenses) {
    final uniqueCategories = <String>{};
    for (var expense in expenses) {
      uniqueCategories.add(expense.category);
    }
    return uniqueCategories.toList();
  }
}
