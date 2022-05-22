// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hyft/widget/avartar.dart';

class MatchingBody extends StatelessWidget {
  MatchingBody(
      {Key? key, required this.name, required this.mood, required this.detail})
      : super(key: key);
  String name;
  String mood;
  String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Avartar
          Avatar(),
          // sizedbos
          SizedBox(
            height: 10,
          ),
          //text
          Text(
            'Jane Doe, Jan 6',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          //sizedbos
          SizedBox(
            height: 10,
          ),
          //Time
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.timer,
                color: Color.fromARGB(196, 158, 158, 158),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Posted 10min ago')
            ],
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 5.0, right: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 202, 197, 197),
                ),
                child: Text('Anxiety'),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 202, 197, 197),
                ),
                child: Text('Anxiety'),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 202, 197, 197),
                ),
                child: Text('Anxiety'),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 202, 197, 197),
                ),
                child: Text('Anxiety'),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Text(
                  'Long Text',
                  style: TextStyle(
                    color: Colors.black45,
                    wordSpacing: 1.0,
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
