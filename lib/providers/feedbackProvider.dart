import 'dart:io';

import 'package:call_them_app/models/senateListModel.dart';
import 'package:call_them_app/utils/senateList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackProvider extends ChangeNotifier {
  final TextEditingController feedback = new TextEditingController();
  final TextEditingController name = new TextEditingController();
  var formKey = GlobalKey<FormState>();

  sendFeedback(context) async {
    await Firestore.instance
        .collection('feedBack')
        .add({'name_or_email': name.text, 'feedback': feedback.text}).then(
            (onValue) {
      showCupertinoModalPopup(
          context: context,
          builder: (_) => new AlertDialog(
                title: new Text("Thank You!"),
                content: new Text("Your Feedback has been received!"),
              ));

      formKey.currentState.reset();
      notifyListeners();
    });
  }
}
