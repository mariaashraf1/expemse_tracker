

import 'package:flutter/cupertino.dart';

class BudgetData extends ChangeNotifier {
  double _budget = 0.0;

  double get budget => _budget;

  set budget(double value) {
    _budget = value;
    notifyListeners(); // Notify listeners when the budget changes
  }
}
