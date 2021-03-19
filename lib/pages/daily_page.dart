import 'package:budget_tracker_app_ui/json/day_month.dart';
import 'package:budget_tracker_app_ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.5),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Transactions',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(days.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeDay = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(days[index]['label'],
                                  style: TextStyle(fontSize: 10)),
                              SizedBox(height: 10),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? primary
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: activeDay == index
                                            ? primary
                                            : black.withOpacity(0.1))),
                                child: Center(
                                  child: Text(
                                    days[index]['day'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            activeDay == index ? white : black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
