import 'dart:io';

import 'package:call_them_app/models/senateListModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SenateProvider extends ChangeNotifier {
  DocumentSnapshot querySnapshot;
  Stream<QuerySnapshot> homeFeeds =
      Firestore.instance.collection('senatorsDB').snapshots();
  final TextEditingController filter = new TextEditingController();
  final TextEditingController mailTitle = new TextEditingController();
  final TextEditingController mailBody = new TextEditingController();
  var formKey = GlobalKey<FormState>();

  String _searchText = "";
  String get searchText => _searchText;

  List<SenatorData> _names = [];
  List<SenatorData> get names => _names;

  Icon _searchIcon = new Icon(Icons.search);
  Icon get searchIcon => _searchIcon;

  Widget _appBarTitle;
  Widget get appBarTitle => _appBarTitle;

  set names(List<SenatorData> val) {
    _names = val;
    notifyListeners();
  }

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

      try {
       
          QuerySnapshot t =
            await Firestore.instance.collection('senatorsDB').getDocuments();
        if (t != null && t.documents != null) {
          t.documents.forEach((f) {
            SenatorData data = SenatorData.fromMap(f.data);
            _names.add(data);
            notifyListeners();
          });
        } 
      } catch (e) {
        print(e.toString());
      }
      // _names = senateListData.senatorData;

      // print(senateListData.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  launchMail(String data) async {
    var url = Uri.encodeFull(
        'mailto:$data?subject=${mailTitle.text}&body=${mailBody.text}');

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchCall(String number) async {
    try {
      var url;
      if (Platform.isAndroid) {
        //FOR Android
        if (await canLaunch('tel:' '$number')) {
          await launch('tel: ' '$number');
        } else {
          throw 'Could not launch tel:$number';
        }
      } else if (Platform.isIOS) {
        //FOR IOS
        url = Uri.encodeFull('tel:$number');

        await launch(url);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  launchSMS(String phone) async {
    var url;
    if (Platform.isAndroid) {
      //FOR Android
      url = 'sms:$phone?body=${mailBody.text}';
      await launch(url);
    } else if (Platform.isIOS) {
      //FOR IOS
      url = Uri.encodeFull('sms:$phone&body=${mailBody.text}');

      await launch(url);
    }
  }
}
