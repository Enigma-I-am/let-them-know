import 'package:call_them_app/providers/feedbackProvider.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FeedbackProvider>(context);
    return Container(
      height: screenHeight(context) - 100,
      child: Form(
        key: provider.formKey,
        child: Column(
          children: <Widget>[
            const YMargin(30),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.06),
                  borderRadius: BorderRadius.circular(4)),
              child: new TextFormField(
                validator: (value) {
                  if (value.isNotEmpty) {
                    return null;
                  } else if (value.isEmpty) {
                    return "This field can't be left empty";
                  } else {
                    return "Name is Invalid";
                  }
                },
                controller: provider.name,
                onEditingComplete: () {},
                decoration: new InputDecoration(
                    border: InputBorder.none, hintText: 'Name or Email'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
               // height: 190,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.06),
                    borderRadius: BorderRadius.circular(4)),
                child: new TextFormField(
                  validator: (value) {
                    if (value.isNotEmpty) {
                      return null;
                    } else if (value.isEmpty) {
                      return "This field can't be left empty";
                    } else {
                      return "Body is Invalid";
                    }
                  },
                  controller: provider.feedback,
                  maxLines: null,
                  decoration: new InputDecoration(
                      border: InputBorder.none, hintText: 'Your Feedback'),
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: OutlineButton(
                        textColor: Colors.blueAccent[700],
                        child: Text('Send Us Your Feedback'),
                        onPressed: () {
                          if(provider.formKey.currentState.validate()){
                            provider.sendFeedback(context);
                          }
                        },
                      ),
                    ),
                    const YMargin(50)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
