import 'package:call_them_app/providers/directoryProvider.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/views/emailSender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DirectoryPage extends StatefulWidget {
  DirectoryPage({Key key}) : super(key: key);

  @override
  _DirectoryPageState createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  DirectoryProvider provider;
  @override
  void initState() {
    loadData();

    super.initState();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    provider.loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DirectoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: provider.appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: provider.searchIcon,
            onPressed: provider.searchPressed,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hi !',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const YMargin(10),
                Text(
                  '• Search by Senator name / District\n• Send text message via the app ASAP',
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
          const YMargin(20),
          for (var i = 0; i < provider?.names?.length ?? 0; i++)
            if (provider.filter.text.isNotEmpty)
              if (provider.names[i].name
                      .toLowerCase()
                      .contains(provider.searchText.toLowerCase()) ||
                  provider.names[i].state
                      .toLowerCase()
                      .contains(provider.searchText.toLowerCase()))
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 18),
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -10,
                            color: Colors.blue.withOpacity(0.5),
                            blurRadius: 25,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(provider.names[i].name ?? ''),
                      subtitle:
                          Text(provider.names[i].state.toUpperCase() ?? ''),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: <Widget>[
                            provider.names[i].phoneNo != null
                                ? IconButton(
                                    icon: Icon(Icons.call),
                                    color: Colors.red,
                                    onPressed: () async {
                                      await provider.launchCall(
                                          provider.names[i].phoneNo);
                                    },
                                  )
                                : Container(),
                            new IconButton(
                              icon: Icon(Icons.email),
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EmailSender(
                                      provider: provider,
                                      senatorData: provider.names[i],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                Container()
            else
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
                child: Container(
                  padding: const EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: -10,
                          color: Colors.blue.withOpacity(0.5),
                          blurRadius: 25,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(provider.names[i].name ?? ''),
                    subtitle: Text(provider.names[i].state.toUpperCase() ?? ''),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          provider.names[i].phoneNo != null
                              ? IconButton(
                                  icon: Icon(Icons.call),
                                  color: Colors.red,
                                  onPressed: () async {
                                    await provider
                                        .launchCall(provider.names[i].phoneNo);
                                  },
                                )
                              : Container(),
                          new IconButton(
                            icon: Icon(Icons.email),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmailSender(
                                    provider: provider,
                                    senatorData: provider.names[i],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
        ],
      ),
    );
  }
}
