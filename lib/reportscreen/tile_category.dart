import 'package:flutter/material.dart';

import 'budgetmanger.dart';

class list_tile2 extends StatefulWidget {
  final double totalSpent;
  final String category;
  list_tile2({Key? key, required this.totalSpent, required this.category,}) : super(key: key);

  @override
  State<list_tile2> createState() => _list_tile2State();
}

class _list_tile2State extends State<list_tile2> {
   double budget=0;
   final BudgetManager budgetManager = BudgetManager();

   @override
   void initState() {
     super.initState();
     // Get the budget for the category when the widget initializes
     budget = budgetManager.getBudgetForCategory(widget.category);
   }

  @override
  Widget build(BuildContext context) {
    return get(widget.category, widget.totalSpent ,context);
  }

  Widget get(String category, double totalSpent,BuildContext context) {
    return ListTile(
      minLeadingWidth: 10,
      onTap:(){
        _showBudgetDialog(context);
      },
      minVerticalPadding:25,
      leading: const Icon(Icons.monetization_on,size: 35,),
      title: Text(category, style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 15,
        color:Color(0xFF1D267D),
      ),),
      trailing: SizedBox(
        height: 60,
        child: Column(
          children: [
            Text("Total spent: \$${totalSpent.toStringAsFixed(1)}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),),
            SizedBox(height: 6,),
            Text("Budget: \$${budget.toStringAsFixed(1)}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),),
          ],
        ),
      ),
      tileColor: Colors.white,
    );
  }

  void _showBudgetDialog(BuildContext context) {
    TextEditingController _budgetController = TextEditingController(text: budget.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Budget'),
          content: TextFormField(
            controller: _budgetController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'New Budget'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  budget = double.parse(_budgetController.text);
                  budgetManager.setBudgetForCategory(widget.category, budget);
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}



