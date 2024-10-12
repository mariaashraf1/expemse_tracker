import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:software_project/accountscreen/user_model.dart';
import 'package:software_project/mainscreen/appbar.dart';

import '../mainscreen/bottom_navigation_bar.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  account createState() => account();
}

class account extends State<accountPage> {
  final box1 = Hive.box<UserModel>('account');


  TextEditingController balance = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController name = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children:  [
                  SizedBox(height: 10,),
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                        "asset/image.jpg"),
                    radius: 80,
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(height: 20,),
                  const Text("User",style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                         padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text("Enter your total balance",textAlign: TextAlign.start,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextField(
                      controller: balance,
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
                        hintText: "please enter your balance",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Balance",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.monetization_on),
                        fillColor: Colors.black,
                        prefixIconColor: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ]),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text("Enter your FIxed monthly Income",textAlign: TextAlign.start,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                     controller: income,
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
                        hintText: "please enter your Income",
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "Incom",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.monetization_on),
                        fillColor: Colors.black,
                        prefixIconColor: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ]),
                ],
              ),

            ),

          ),

        ),
      ),
        bottomNavigationBar: CustomBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            double? value1 = double.tryParse(balance.text);
            double? value2 = double.tryParse(income.text);
            var account=UserModel(value1!,value2!);
            box1.add(account);
            Navigator.of(context).pop();
            print(box1.length);
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
            child: const Center(
              child: Text("Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                fontSize: 15)),
            ),
          ),
        )
    );
  }
}
