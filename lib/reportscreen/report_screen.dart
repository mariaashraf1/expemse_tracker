import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:software_project/expensesScreen/expenses_model.dart';
import 'package:software_project/mainscreen/appbar.dart';
import 'package:software_project/mainscreen/bottom_navigation_bar.dart';
import 'package:software_project/reportscreen/tile_category.dart';
import 'ExpenseChart.dart';


class HistogramChartPage extends StatefulWidget {
  @override
  _HistogramChartPageState createState() => _HistogramChartPageState();
}

class _HistogramChartPageState extends State<HistogramChartPage> {
  double budget =0; // Initial budget value

  void updateBudget(double newBudget) {
    setState(() {
      budget = newBudget;
    });
  }

  List<Expense_model> expensesData = [];
  var history;
  final box = Hive.box<Expense_model>('expenses');
  List<String> uniqueCategories =[];

  Map<String, double> totalSpentByCategory = {};

  @override
  void initState() {
    super.initState();
    getExpensesData();
    _updateUniqueCategories();

  }

  void _updateUniqueCategories() {
    setState(() {
      uniqueCategories = box.values.map((expense) => expense.category).toSet().toList();
      for (var category in uniqueCategories) {
        double totalSpent = Hive.box<Expense_model>('expenses').values
            .where((expense) => expense.category == category)
            .map((expense) => expense.amount)
            .reduce((value, element) => value + element);
        totalSpentByCategory[category] = totalSpent;
      }

    });
  }

  void getExpensesData() async {
    var box = await Hive.openBox<Expense_model>('expenses');
    expensesData.clear();

    for (var key in box.keys) {
      Expense_model expense = box.get(key) as Expense_model;
      expensesData.add(expense);
    }

    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    final userModel = box.values.isNotEmpty ? box.values.toList().last : null;
    final userModel2 = box.values.isNotEmpty ? box.values.toList().first : null;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(),
      body: Column(
        children: [const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Reports',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ]
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'From: ${userModel2?.date.toLocal().toString().split(' ')[0]} '
                      'to: ${userModel?.date.toLocal().toString().split(' ')[0]}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1D267D),
                    Color(0xFF5C469C),
                    Color(0xFFD4ADFC),
                  ],
                  transform: GradientRotation(pi / 4),
                ),
                border: Border.all(
                    color: const Color.fromRGBO(49, 27, 146, 1)),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: expensesData.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ExpenseChart(groupExpensesByDayOfWeek(expensesData)),
            ),
          ),const SizedBox(height: 10),
               Padding(
                   padding: const EdgeInsets.all(8.0),
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: const [
                    Text(
                 'Categories',
                 style: TextStyle(
                   fontSize: 20,
                color: Colors.black,
                     fontWeight: FontWeight.bold
                ),
              ),
                ]
                ),
             ),const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                itemCount: uniqueCategories.length,
                itemBuilder: (context, int index) {
                  String category = uniqueCategories[index];
                  double totalSpent = totalSpentByCategory[category] ?? 0;
                  return Container(
                    child: Card(
                      child: list_tile2( totalSpent: totalSpent, category: category),
                    ),
                  );
                },
              )
          )
           ],
         ),
        bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Map<String, double> groupExpensesByDayOfWeek(List<Expense_model> expensesData) {
    Map<String, double> dayTotals = {
    '1': 0,
    '2': 0,
    '3': 0,
    '4': 0,
    '5': 0,
    '6': 0,
    '7': 0,
    '8': 0,
    '9': 0,
    '10': 0,
    '11': 0,
    '12': 0,
    '13': 0,
    '14': 0,
    '15': 0,
    '16': 0,
    '17': 0,
    '18': 0,
    '19': 0,
    '20': 0,
    '21': 0,
    '22': 0,
    '23': 0,
    '24': 0,
    '25': 0,
    '26': 0,
    '27': 0,
    '28': 0,
    '29': 0,
    '30': 0,
    '31': 0,
    };

    for (var expense in expensesData) {
      String day;
      switch (expense.date.day) {
        case 1:
          day = '1';
          break;
        case 2:
          day = '2';
          break;
        case 3:
          day = '3';
          break;
        case 4:
          day = '4';
          break;
        case 5:
          day = '5';
          break;
        case 6:
          day = '6';
          break;
        case 7:
          day = '7';
          break;
        case 8:
          day = '8';
          break;
        case 9:
          day = '9';
          break;
        case 10:
          day = '10';
          break;
        case 11:
          day = '11';
          break;
        case 12:
          day = '12';
          break;
        case 13:
          day = '13';
          break;
        case 14:
          day = '14';
          break;
        case 15:
          day = '15';
          break;
        case 16:
          day = '16';
          break;
        case 17:
          day = '17';
          break;
        case 18:
          day = '18';
          break;
        case 19:
          day = '19';
          break;
        case 20:
          day = '20';
          break;
        case 21:
          day = '21';
          break;
        case 22:
          day = '22';
          break;
        case 23:
          day = '23';
          break;
        case 24:
          day = '24';
          break;
        case 25:
          day = '25';
          break;
        case 26:
          day = '26';
          break;
        case 27:
          day = '27';
          break;
        case 28:
          day = '28';
          break;
        case 29:
          day = '29';
          break;
        case 30:
          day = '30';
          break;
        default:
          day = '31';
          break;
      }
      dayTotals[day] = dayTotals[day]! + expense.amount;
    }

    return dayTotals;
  }


    }

