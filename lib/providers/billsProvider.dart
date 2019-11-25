import 'dart:io';

import 'package:call_them_app/models/senateListModel.dart';
import 'package:call_them_app/utils/senateList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BillsProvider extends ChangeNotifier {
  DocumentSnapshot querySnapshot;
  Stream<QuerySnapshot> negBillsFeeds =
      Firestore.instance.collection('-billsDB').snapshots();
  final TextEditingController filter = new TextEditingController();

  String _searchText = "";

  var tags = [
    'Human Rights',
    'Power Oil & Gas',
    'Agriculture',
    'Education',
    'Health',
    'Finance',
    'Transport',
    'Security'
  ];
  String get searchText => _searchText;

  Icon _searchIcon = new Icon(Icons.search);
  Icon get searchIcon => _searchIcon;

  Widget _appBarTitle;
  Widget get appBarTitle => _appBarTitle;

  set searchIcon(Icon val) {
    _searchIcon = val;
    notifyListeners();
  }

  set appBarTitle(Widget val) {
    _appBarTitle = val;
    notifyListeners();
  }

  set searchText(String val) {
    _searchText = val;
    notifyListeners();
  }

  void searchPressed() {
    if (this.searchIcon.icon == Icons.search) {
      this.searchIcon = new Icon(Icons.close);
      this.appBarTitle = Container(
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.06),
            borderRadius: BorderRadius.circular(20)),
        child: new TextField(
          controller: filter,
          decoration: new InputDecoration(
              border: InputBorder.none,
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'),
        ),
      );
    } else {
      this.searchIcon = new Icon(Icons.search);
      this.appBarTitle = null;
      filter.clear();
    }
  }

  loadData(context) async {
    Firestore.instance.enablePersistence(true);
    try {
      filter.addListener(() {
        if (filter.text.isEmpty) {
          _searchText = "";
          notifyListeners();
        } else {
          _searchText = filter.text;
          notifyListeners();
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
