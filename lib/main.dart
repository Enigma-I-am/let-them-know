import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/views/directory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undraw/undraw.dart';

import 'providers/directoryProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => DirectoryProvider()),
      ],
      child: MaterialApp(
        title: 'Call Them Out',
        theme: ThemeData(
          primarySwatch: Colors.blue,
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
            child: UnDraw(
              color: Colors.white,
              illustration: UnDrawIllustration.night_calls,
              placeholder:
                  CircularProgressIndicator(), //optional, default is the CircularProgressIndicator().
              errorWidget: Icon(Icons.error_outline,
                  color: Colors.red,
                  size:
                      50), //optional, default is the Text('Could not load illustration!').
            ),
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
              'There is a bill that has passed the second reading in the Senate. This bills aim is to curb our use of social media with the reasoning that the Senate wants to curb the spreading of false information when in reality they want to limit our freedom of speech and our right to criticise them. They are representatives of Nigerians and have no right to do anything contrary to our wish because this is a democracy and they are to exercise our wishes. This is not our wish!',
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
                    builder: (context) => DirectoryPage(),
                  ),
                );
              },
            ),
          ),  const YMargin(50),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
