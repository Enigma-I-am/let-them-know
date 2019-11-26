import 'package:call_them_app/models/negBillsModel.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/views/directory/senateDirectory.dart';
import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BillsDetailPage extends StatefulWidget {
  final NegativeBills negativeBills;
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
                    image: NetworkImage(widget?.negativeBills?.imageUrl ?? '')),
              ),
            ),
          ),
          Container(
            width: screenWidth(context),
            height: screenHeight(context, percent: 0.36),
            decoration: BoxDecoration(color: Colors.black26),
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
                            widget?.negativeBills?.title ?? '',
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
                                  widget?.negativeBills?.category ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.blueAccent[700],
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11),
                                ),
                                const YMargin(20),
                                Text(
                                  widget?.negativeBills?.desc ?? '',
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SenateDirectory(),
                            ),
                          );
                        },
                      ),
                    ),
                    const YMargin(30),
                    Text(
                      "Sign the Petition!",
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    const YMargin(20),
                    Container(
                        width: double.infinity,
                        height: 50,
                        child: OutlineButton(
                          color: Colors.blueAccent[700],
                          textColor: Colors.blueAccent[700],
                          child: SpringButton(
                            SpringButtonType.OnlyScale,
                            Image.asset(
                              'assets/change.png',
                              scale: 3,
                            ),
                            onTap: () async {
                              var url = Uri.encodeFull(
                                  widget.negativeBills.changeUrl);

                              await launch(url);
                            },
                          ),
                          onPressed: null,
                        )),
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
