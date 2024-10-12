import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:software_project/expensesScreen/expenses_model.dart';

import '../mainscreen/bottom_navigation_bar.dart';
import 'dropdown_menu.dart';
import 'func_to_add_expenses.dart';

class expensesPage extends StatefulWidget {
  const expensesPage({Key? key}) : super(key: key);

  @override
  expenses createState() => expenses();
}

class expenses extends State<expensesPage> {
  final box = Hive.box<Expense_model>('expenses');

  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController amount = TextEditingController();
  String selectedOption ='other';
  List<String> options = [
    'Food',
    'Education',
    'Transportation',
    'Bills',
    'other',

  ];

  void initState() {
    super.initState();
    dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        resizeToAvoidBottomInset:false,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor:Colors.grey.shade100,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  const Text("ADD ",style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 70),
                  TextField(
                    controller: description,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: BorderSide(color: Colors.black), // Color of the outline border when enabled
                      ),
                      hintText: "please enter Description",
                      labelText: "Description",
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      fillColor: Colors.black,
                      prefixIconColor: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                      controller: amount,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(70)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(70),
                          borderSide: BorderSide(color: Colors.black), // Color of the outline border when enabled
                        ),
                        hintText: "please enter your amount of expense",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "amount",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.monetization_on),
                        fillColor: Colors.black,
                        prefixIconColor: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ]),
                  SizedBox(height: 40), // Adjust spacing as needed
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      hintText: "Select Date",
                      labelText: "Date",
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.calendar_today),
                      fillColor: Colors.black,
                      prefixIconColor: Colors.black,
                    ),
                  ),SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text("choose category",textAlign: TextAlign.start,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height:5),
                  SingleChildScrollView(
                    child: CustomDropdownMenu(
                       intial_value: selectedOption,
                        options: options,
                        onChanged: (String newValue) {
                          setState(() {
                            if (newValue == 'other') {
                               showAddItemDialog(context, options, selectedOption!, (String newItem) {
                                setState(() {
                                  selectedOption = newItem;
                                },
                                   );
                              });
                            }else{
                              selectedOption=newValue;

                            }
                          });} ),
                  ),
                  SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          double? value = double.tryParse(amount.text);
          var expense=Expense_model(selectedOption, description.text, value!, selectedDate);
          box.add(expense);
          Navigator.of(context).pop();

        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFF1D267D),
                Color(0xFF5C469C),
                Color(0xFFD4ADFC),
              ],
              transform: GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(CupertinoIcons.check_mark),
        ),
      )
    );
  }
}