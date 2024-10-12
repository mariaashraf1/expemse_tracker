import 'package:hive/hive.dart';

part 'expenses_model.g.dart';

@HiveType(typeId: 1)
class Expense_model extends HiveObject{
  @HiveField(0)
  final String description;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final DateTime date;

  Expense_model(
   this.category,
   this.description,
   this.amount,
   this.date
      );
  Expense_model.fromMap({
    required this.date,
    required this.amount,
  })   : category = '',
        description = '';
}
