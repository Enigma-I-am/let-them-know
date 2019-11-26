import 'package:call_them_app/views/pages/billsPage.dart';
import 'package:call_them_app/views/pages/directoryPage.dart';
import 'package:call_them_app/views/pages/feedbackPage.dart';
import 'package:call_them_app/views/pages/policiesPage.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  bool _isCollapsed = true;
  bool get isCollapsed => _isCollapsed;

  set isCollapsed(bool val) {
    _isCollapsed = val;
    notifyListeners();
  }

  var _index = 0;
  get index => _index;

  set index(val) {
    _index = val;
    notifyListeners();
  }

  menuList() => [
        BillsPage(isCollapsed: _isCollapsed),
        PoliciesPage(),
        DirectoryPages(),
        FeedbackPage(),
      ];

  selectPage(index) {
    _index = index;

    notifyListeners();
  }
}
