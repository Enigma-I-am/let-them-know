import 'package:call_them_app/models/senateListModel.dart';
import 'package:call_them_app/providers/directoryProvider.dart';
import 'package:call_them_app/utils/emailData.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:flutter/material.dart';

class EmailSender extends StatelessWidget {
  final SenatorData senatorData;
  final DirectoryProvider provider;
  const EmailSender(
      {Key key, @required this.senatorData, @required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Form(
        key: provider.formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${senatorData?.name ?? ''}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const YMargin(10),
                  Text(
                    senatorData?.state ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                      height: 1.7,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.06),
                  borderRadius: BorderRadius.circular(4)),
              child: new TextFormField(
                initialValue: emailTitle,
                validator: (value) {
                  if (value.isNotEmpty) {
                    provider.mailTitle.text = value;

                    return null;
                  } else if (value.isEmpty) {
                    return "This field can't be left empty";
                  } else {
                    return "Title is Invalid";
                  }
                },
                onEditingComplete: () {},
                decoration: new InputDecoration(
                    border: InputBorder.none, hintText: 'Subject of Mail'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.06),
                  borderRadius: BorderRadius.circular(4)),
              child: new TextFormField(
                initialValue: emailMessage,
                validator: (value) {
                  if (value.isNotEmpty) {
                    provider.mailBody.text = value;

                    return null;
                  } else if (value.isEmpty) {
                    return "This field can't be left empty";
                  } else {
                    return "Body is Invalid";
                  }
                },
                //controller: provider.mailTitle,
                maxLines: null,
                decoration: new InputDecoration(
                    border: InputBorder.none, hintText: 'Subject of Mail'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      color: Colors.blueAccent[700],
                      textColor: Colors.white,
                      child: Text('Send ${senatorData.name} this mail'),
                      onPressed: () {
                        if (provider.formKey.currentState.validate()) {
                          provider.launchMail(senatorData.email);
                        }
                      },
                    ),
                  ),
                  const YMargin(20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: OutlineButton(
                      color: Colors.blueAccent[700],
                      textColor: Colors.blueAccent[700],
                      child: Text('Send ${senatorData.name} this SMS'),
                      onPressed: () {
                        if (provider.formKey.currentState.validate()) {
                          provider.launchMail(senatorData.email);
                        }
                      },
                    ),
                  ),
                  const YMargin(50)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
