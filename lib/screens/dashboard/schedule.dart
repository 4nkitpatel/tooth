import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:tooth/controllers/Schedule.dart';
import 'package:tooth/widgets/custome_date_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ScheduleController scheduleC = Get.put(ScheduleController());
  String selectedDate = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: "Schedule".text.white.make(),
          // "Mr. Andy".text.size(17).make(),
          backgroundColor: Color(0xff1F2125),
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: "Cancel"
                .text
                .color(Color(0xff007AFF))
                .make()
                .pOnly(top: 18, left: 18),
          ),
          actions: <Widget>[
            // if (isSelected)
            InkWell(
              onTap: () {
                Get.toNamed("/dashboard");
              },
              child: "Done"
                  .text
                  .center
                  .color(Color(0xff007AFF))
                  .make()
                  .pOnly(top: 18, right: 16),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff1F2125),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: ImageIcon(
                  AssetImage('assets/nav-boy.png'),
                  size: 40,
                  color: Color(0xffA6A6A6),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: ImageIcon(
                  AssetImage('assets/nav-calendar.png'),
                  size: 40,
                  color: Color(0xffA6A6A6),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: ImageIcon(
                  AssetImage('assets/nav-laddy.png'),
                  size: 40,
                  color: Color(0xffA6A6A6),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  size: 35,
                  color: Color(0xffA6A6A6),
                ),
              )
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Calendar(
                cb: (text) {
                  setState(() {
                    selectedDate = text;
                  });
                },
              ),
              20.heightBox,
              Row(
                children: [
                  selectedDate == ''
                      ? "Select a date".text.white.make()
                      : selectedDate.text.white.make(),
                  Spacer(),
                  "All Clinics".text.color(Color(0xff0A84FF)).make(),
                ],
              ),
              10.heightBox,
              Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  // color: Colors.red,
                  child: Obx(() {
                    if (scheduleC.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else
                      return ListView.separated(
                        separatorBuilder: (context, index) => 10.heightBox,
                        itemCount: scheduleC.schedulesList.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: slideRightBackground(context),
                            secondaryBackground: slideLeftBackground(),
                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.endToStart) {
                                final bool res = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Are you sure you want to Approve item at ${index}?"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          FlatButton(
                                            child: Text(
                                              "Delete",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () {
                                              // TODO: Delete the item from DB etc..
                                              // setState(() {
                                              //   itemsList.removeAt(index);
                                              // });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                                return res;
                              } else {
                                // TODO: Navigate to edit page;
                              }
                            },
                            key: Key(index.toString()),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff1F2125),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed("/patientDetails");
                                  },
                                  child: ClipRRect(
                                    child: Container(
                                      // color: Color(0xff1F2125),
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              scheduleC.schedulesList[index]
                                                  .name.text
                                                  .color(Color(0xff00ADB5))
                                                  .make(),
                                              scheduleC.schedulesList[index]
                                                  .treatment.text
                                                  .size(10)
                                                  .white
                                                  .make(),
                                              scheduleC.schedulesList[index]
                                                  .visit.text
                                                  .size(10)
                                                  .color(Color(0xffA8A3A3))
                                                  .make(),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                scheduleC.schedulesList[index]
                                                    .state.text
                                                    .color(Color(0xff00ADB5))
                                                    .make(),
                                                scheduleC.schedulesList[index]
                                                    .time.text
                                                    .size(10)
                                                    .white
                                                    .make(),
                                                scheduleC.schedulesList[index]
                                                    .insuredStatus.text
                                                    .size(10)
                                                    .white
                                                    .make(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ).p8(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                  })),
            ],
          ),
        ),
      ),
    );
  }

  Container slideLeftBackground() {
    return Container(
      color: Color(0xff006064),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              " Approve",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }

  Container slideRightBackground(BuildContext context) {
    return Container(
      color: Color(0xff51AADF),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.calendar_today_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              // color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.6,
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => 10.widthBox,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 33,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
