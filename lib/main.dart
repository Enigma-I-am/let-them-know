import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/views/directory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/billsProvider.dart';
import 'providers/directoryProvider.dart';
import 'providers/menuProvider.dart';
import 'views/menuPage.dart';
import 'views/pages/billsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => DirectoryProvider()),
        ChangeNotifierProvider(builder: (_) => MenuProvider()),
        ChangeNotifierProvider(builder: (_) => BillsProvider()),
      ],
      child: MaterialApp(
        title: 'Let Them Know!',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Orkney'
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 260,
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Image.asset('assets/homeImage.png'),
          ),
          const YMargin(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const YMargin(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              'They are representatives of Nigerians and have no right to do anything contrary to our wish because this is a democracy and they are to exercise our wishes. This is not our wish!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                height: 1.6,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const YMargin(40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            height: 50,
            child: FlatButton(
              color: Colors.blueAccent[700],
              textColor: Colors.white,
              child: Text('Next'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuPage(),
                  ),
                );
              },
            ),
          ),
          const YMargin(50),
        ],
      ), );
  }
}
