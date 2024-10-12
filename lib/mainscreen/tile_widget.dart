import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:software_project/expensesScreen/expenses_model.dart';
import 'package:software_project/expensesScreen/expenses_screen.dart';

class list_tile extends StatelessWidget {
  list_tile({Key? key, required this.history, required this.index}) : super(key: key);
  final Expense_model history;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  get(int index, Expense_model history) {
    return ListTile(
        leading: const Icon(Icons.monetization_on,size: 35,),
    title: Text(history.category,style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 15,
      color:Color(0xFF1D267D),
    ),),
    subtitle: Text(history.description,style: const TextStyle(
      fontSize: 10
    ),),
    trailing: Text(history.amount.toString(),style: const TextStyle(
      fontSize: 15
    ),),
    tileColor: Colors.white,
    );
  }

  }



