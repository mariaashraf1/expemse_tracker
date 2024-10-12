import 'package:hive/hive.dart';
import '../expensesScreen/expenses_model.dart';
import 'budget_model.dart';

class BudgetManager {
  final Box<CategoryBudget> _budgetBox = Hive.box<CategoryBudget>('categoryBudgets');

  void setBudgetForCategory(String category, double budgetAmount) {
    int existingIndex = -1;
    for (int i = 0; i < _budgetBox.length; i++) {
      if (_budgetBox.getAt(i)?.category == category) {
        existingIndex = i;
        break;
      }
    }

    if (existingIndex != -1) {
      final existingBudget = _budgetBox.getAt(existingIndex);
      existingBudget!.budgetAmount = budgetAmount;
      _budgetBox.putAt(existingIndex, existingBudget);
    } else {
      final newBudget = CategoryBudget(category, budgetAmount);
      _budgetBox.add(newBudget);
    }
  }



  double getBudgetForCategory(String category) {
    final budget = _budgetBox.values.firstWhere(
          (budget) => budget.category == category,
      orElse: () => CategoryBudget('', 0), // Provide a default CategoryBudget instance
    );

    return budget?.budgetAmount ?? 0;
  }
// Other methods for managing budgets can be added here
}
