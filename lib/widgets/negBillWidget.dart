import 'package:call_them_app/models/negBillsModel.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/views/pages/billsDetailsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

class NegBillsWidget extends StatelessWidget {
  final DocumentSnapshot data;
  final isCollapsed;

  const NegBillsWidget({
    Key key,
    @required this.data,
    this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedData = NegativeBills.fromSnapshot(data);
    return Stack(
      children: <Widget>[
        Container(
            height: 160,
            width: screenWidth(context),
            margin: EdgeInsets.all(8),
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
                borderRadius: BorderRadius.circular(4))),
        Container(
          height: 170,
          width: screenWidth(context),
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'bills',
                  child: SpringButton(
                    SpringButtonType.OnlyScale,
                    Container(
                      margin: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(feedData.imageUrl ?? '')),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onTap: () {
                     
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BillsDetailPage(negativeBills: feedData),
                        ),
                      );
                  },
                  title: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      feedData?.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      YMargin(10),
                      Text(
                        feedData?.category ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w300,
                            fontSize: 11),
                      ),
                      const YMargin(7),
                      Text(
                        feedData?.desc ?? "",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
