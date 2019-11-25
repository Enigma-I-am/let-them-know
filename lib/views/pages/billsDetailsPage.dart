import 'package:call_them_app/models/negBillsModel.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

class BillsDetailPage extends StatefulWidget {
  NegativeBills negativeBills;
  BillsDetailPage({Key key, this.negativeBills}) : super(key: key);

  @override
  _BillsDetailPageState createState() => _BillsDetailPageState();
}

class _BillsDetailPageState extends State<BillsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Hero(
            tag: 'bills',
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context, percent: 0.36),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/3217928/pexels-photo-3217928.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  XMargin(10),
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.share),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
              YMargin(screenHeight(context, percent: 0.16)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: screenWidth(context),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: -7,
                          offset: Offset(0, 10),
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 25,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(18),
                          title: Text(
                            'Social Meda Bill',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 21),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "SOCIAL MEDIA",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.blueAccent[700],
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11),
                                ),
                                const YMargin(20),
                                Text(
                                  "There is a bill that has passed the second reading in the Senate. This bill's aim is to curb our use of social media with the reasoning that the Senate wants to curb the spreading of false information when in reality they want to limit our freedom of speech and our right to criticize them. They are representatives of Nigerians and have no right to do anything contrary to our wish because this is a democracy and they are to exercise our wishes. This is not our wish!",
                                  style: TextStyle(
                                      height: 1.4,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const YMargin(30),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: FlatButton(
                        color: Colors.blueAccent[700],
                        textColor: Colors.white,
                        child: Text('Contact Your Senators'),
                        onPressed: () {},
                      ),
                    ),
                    const YMargin(20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: OutlineButton(
                        color: Colors.blueAccent[700],
                        textColor: Colors.blueAccent[700],
                        child: Text('Send  this SMS'),
                        onPressed: () {},
                      ),
                    ),
                    const YMargin(50)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
