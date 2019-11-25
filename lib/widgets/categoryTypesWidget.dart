import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

class CategoryTypes extends StatelessWidget {
  final String tag;
  const CategoryTypes({
    Key key,
    @required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpringButton(
      SpringButtonType.OnlyScale,
      Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 60,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: -12,
                        offset: Offset(0, 10),
                        color: Colors.grey.withOpacity(0.4),
                        blurRadius: 25,
                      ),
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://picsum.photos/200/200')),
                    borderRadius: BorderRadius.circular(4)),
              ),
              Container(
                height: 60,
                width: 90,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Colors.blueAccent[700],
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    tag != null ? tag : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
