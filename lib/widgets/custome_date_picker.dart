import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Calendar extends StatefulWidget {
  final Function cb;
  const Calendar({Key key, this.cb}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: media.height * 0.055, // 45,
          child: Container(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: media.height * 0.015);
              },
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: 365,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentDateSelectedIndex = index;
                      selectedDate = DateTime.now().add(Duration(days: index));
                      widget.cb(
                          listOfMonths[selectedDate.month - 1] +
                              ' ' +
                              selectedDate.day.toString() +
                              ', ' +
                              listOfDays[selectedDate.weekday - 1].toString(),
                          selectedDate);
                    });
                  },
                  child: Container(
                    height: media.height * 0.05,
                    width: media.width * 0.08,
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: currentDateSelectedIndex == index
                              ? Colors.white
                              : Color(0xff707070),
                          width: 1),
                      color: currentDateSelectedIndex == index
                          ? Color(0xff0A84FF)
                          : Color(0xff161819),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listOfDays[DateTime.now()
                                      .add(Duration(days: index))
                                      .weekday -
                                  1]
                              .toString(),
                          style: TextStyle(
                              fontSize: media.height * 0.015,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          DateTime.now()
                              .add(Duration(days: index))
                              .day
                              .toString(),
                          style: TextStyle(
                              fontSize: media.height * 0.015,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ).centered(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
