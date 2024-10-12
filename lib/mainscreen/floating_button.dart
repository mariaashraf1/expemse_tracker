import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_project/expensesScreen/expenses_screen.dart';


class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        Navigator.push(
            context,MaterialPageRoute(builder: (context) =>const expensesPage()));

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
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
