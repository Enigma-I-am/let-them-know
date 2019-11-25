import 'package:call_them_app/providers/menuProvider.dart';
import 'package:call_them_app/utils/margin.dart';
import 'package:call_them_app/views/pages/billsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  MenuProvider provider;
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MenuProvider>(context);
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: isCollapsed ? null : Colors.blueAccent[700],
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Let Them\nKnow !',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
                const YMargin(200),
                MenuItem(
                  title: 'Bills',
                  icon: Icons.receipt,
                ),
                MenuItem(
                  title: 'Policies',
                  icon: Icons.people,
                ),
                MenuItem(
                  title: 'Directory',
                  icon: Icons.contacts,
                ),
                MenuItem(
                  title: 'Feedback',
                  icon: Icons.mail,
                ),
                const YMargin(200),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.3 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            elevation: 8,
            child: InkWell(
              onTap: isCollapsed
                  ? null
                  : () {
                      setState(() {
                        if (isCollapsed)
                          _controller.forward();
                        else
                          _controller.reverse();

                        isCollapsed = !isCollapsed;
                      });
                    },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
                  width: screenWidth,
                  height: screenHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            child: Icon(Icons.menu, color: Colors.grey),
                            onTap: () {
                              setState(() {
                                if (isCollapsed)
                                  _controller.forward();
                                else
                                  _controller.reverse();

                                isCollapsed = !isCollapsed;
                              });
                            },
                          ),
                          const XMargin(30),
                          Text("Bills",
                              style: TextStyle(
                                  fontSize: 24, color: Colors.black87)),
                          Spacer()
                        ],
                      ),
                      BillsPage(isCollapsed: isCollapsed),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const MenuItem({
    Key key,
    this.title,
    this.onTap,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const XMargin(10),
              Icon(
                icon,
                color: Colors.white.withOpacity(0.9),
                size: 22,
              ),
              const XMargin(14),
              Text(title ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
          const YMargin(50),
        ],
      ),
    );
  }
}
