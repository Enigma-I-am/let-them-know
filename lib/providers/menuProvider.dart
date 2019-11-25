import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  bool isCollapsed = true;
  final Duration duration = const Duration(milliseconds: 200);

  AnimationController _controller;
  AnimationController get controller => _controller;

  Animation<double> _scaleAnimation;
  Animation<double> get scaleAnimation => _scaleAnimation;

  Animation<double> _menuScaleAnimation;
  Animation<double> get menuScaleAnimation => _menuScaleAnimation;

  Animation<Offset> _slideAnimation;

  Animation<Offset> get slideAnimation => _slideAnimation;

  set slideAnimation(Animation<Offset> val) {
    _slideAnimation = val;
    notifyListeners();
  }

  set menuScaleAnimation(Animation<double> val) {
    _menuScaleAnimation = val;
    notifyListeners();
  }

  set scaleAnimation(Animation<double> val) {
    _scaleAnimation = val;
    notifyListeners();
  }

  set controller(val) {
    _controller = val;
    notifyListeners();
  }

  void loadData(TickerProvider vsync) {
    print('fdfd');
    _controller = AnimationController(vsync: vsync, duration: duration);
    notifyListeners();
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    notifyListeners();
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    notifyListeners();
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    notifyListeners();
  }
}
