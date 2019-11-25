import 'package:call_them_app/providers/billsProvider.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/widgets/categoryTypesWidget.dart';
import 'package:call_them_app/widgets/negBillWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spring_button/spring_button.dart';

class BillsPage extends StatefulWidget {
  final bool isCollapsed;

  const BillsPage({Key key, this.isCollapsed}) : super(key: key);
  @override
  _BillsPageState createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BillsProvider>(context);
    return Container(
      height: screenHeight(context) - 100,
      child: Column(
        children: <Widget>[
          const YMargin(50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -12,
                  offset: Offset(0, 10),
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 25,
                ),
              ],
            ),
            child: new TextField(
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: new Icon(Icons.search),
                  hintText: 'Search for a bill...'),
            ),
          ),
          const YMargin(40),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var tag in provider.tags) CategoryTypes(tag: tag),
                ],
              ),
            ),
          ),
          Expanded(
            child: BuildUI(widget.isCollapsed, provider: provider),
          ),
        ],
      ),
    );
  }
}

class BuildUI extends StatelessWidget {
  final BillsProvider provider;
  final bool isCollapsed;
  const BuildUI(this.isCollapsed, {Key key, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: provider.negBillsFeeds,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
              child: Container(
            height: 45,
            width: 45,
            child: CircularProgressIndicator(),
          ));
        return BuildFeedList(snapshot.data.documents, isCollapsed);
      },
    );
  }
}

class BuildFeedList extends StatelessWidget {
  final List<DocumentSnapshot> snapshot;
  final bool isCollapsed;
  const BuildFeedList(this.snapshot, this.isCollapsed);

  @override
  Widget build(BuildContext context) => snapshot.length > 0
      ? Column(children: [
          for (var data in snapshot.reversed.toList())
            NegBillsWidget(isCollapsed: isCollapsed, data: data)
        ])
      : Center(
          child: Column(
            children: <Widget>[
              const YMargin(60),
              Opacity(
                opacity: 0.5,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://media.istockphoto.com/vectors/open-box-icon-vector-id635771440?k=6&m=635771440&s=612x612&w=0&h=IESJM8lpvGjMO_crsjqErVWzdI8sLnlf0dljbkeO7Ig=',
                              scale: 3))),
                ),
              ),
              const YMargin(20),
              Text('No Posts'),
            ],
          ),
        );
}
