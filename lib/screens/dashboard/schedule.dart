import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/controllers/Schedule.dart';
import 'package:tooth/models/Schedule.dart';
import 'package:tooth/screens/dashboard/address_list.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
import 'package:tooth/screens/dashboard/medication.dart';
import 'package:tooth/screens/dashboard/postpone_app.dart';
import 'package:tooth/widgets/custome_date_picker.dart';
import 'package:tooth/widgets/refresh_indicator.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ScheduleController scheduleC = Get.put(ScheduleController());
  String selectedDate = '';
  String postponedDate = '';
  List<Schedule> filteredData = [];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
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
                  onTap: () {
                    Get.toNamed("/dashboard");
                  },
                  child: Container(
                    height: 40,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage('assets/nav-boy.png'),
                          size: 25,
                          color: Color(0xffA6A6A6),
                        ),
                        3.heightBox,
                        Text(
                          "Dashboard",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        )
                      ],
                    ),
                  ).pOnly(left: 10),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.toNamed("/schedule");
                  },
                  child: Container(
                    height: 45,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage('assets/nav-calendar.png'),
                          size: 25,
                          color: Color(0xffA6A6A6),
                        ),
                        3.heightBox,
                        Text(
                          "Appointment",
                          style: TextStyle(color: Colors.blue, fontSize: 9),
                        )
                      ],
                    ),
                  ).pOnly(top: 5),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Get.toNamed("/patients");
                  },
                  child: Container(
                    height: 40,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage('assets/nav-laddy.png'),
                          size: 25,
                          color: Color(0xffA6A6A6),
                        ),
                        3.heightBox,
                        Text(
                          "Patients",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        )
                        // "Patients".text.size(5).white.make()
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    // Get.toNamed("/patients");
                  },
                  child: Container(
                    height: 40,
                    child: Column(
                      children: [
                        ImageIcon(
                          AssetImage('assets/more_icon.png'),
                          size: 25,
                          color: Color(0xffA6A6A6),
                        ),
                        3.heightBox,
                        Text(
                          "More",
                          style: TextStyle(color: Colors.white, fontSize: 9),
                        )
                        // "Patients".text.size(5).white.make()
                      ],
                    ),
                  ),
                ).pOnly(right: 10),
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
                  cb: (text, realDate) {
                    print(text);
                    print(realDate);
                    setState(() {
                      selectedDate = text;
                      scheduleC.fetchSchedules(timeFilter: realDate.toString());
                    });
                  },
                ),
                20.heightBox,
                Row(
                  children: [
                    selectedDate == ''
                        ? "Select a date"
                            .text
                            .size(media.height * 0.02 - 5)
                            .white
                            .make()
                        : selectedDate.text.white.make(),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(AddressListPage(
                          cb: (data, isSelected) {
                            isSelected
                                ? filteredData +=
                                    scheduleC.schedulesList.filter((element) {
                                    return element.addressName ==
                                        data.addressName;
                                  }).toList()
                                : filteredData = filteredData.filter((element) {
                                    return element.addressName !=
                                        data.addressName;
                                  }).toList();
                            setState(() {});
                          },
                        ));
                      },
                      child: "All Clinics"
                          .text
                          .size(media.height * 0.02 - 5)
                          .color(Color(0xff0A84FF))
                          .make(),
                    )
                  ],
                ),
                10.heightBox,
                Container(
                    height: MediaQuery.of(context).size.height * 0.58,
                    // color: Colors.red,
                    child: Obx(() {
                      if (scheduleC.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else if (scheduleC.schedulesList.length == 0)
                        return "No data available"
                            .text
                            .color(Color(0xff646262))
                            .make();
                      else
                        return RefreshWidget(
                          child: generateDismissible(
                            media,
                            filteredData.length > 0
                                ? filteredData
                                : scheduleC.schedulesList,
                          ),
                          onRefresh: scheduleC.fetchSchedules,
                        );
                    })),
              ],
            ),
          )),
    );
  }

  ListView generateDismissible(Size media, List data) {
    return ListView.separated(
      separatorBuilder: (context, index) => 10.heightBox,
      itemCount: data.length,
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
                      content: Text("Are you sure you want to Approve this"),
                      actions: <Widget>[
                        // FlatButton(
                        //   child: Text(
                        //     "Cancel",
                        //     style: TextStyle(color: Colors.black),
                        //   ),
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //   },
                        // ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: "Cancel"
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              .make(),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Coolors.secondaryBtn),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(10)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            var res = await scheduleC.onAppointmentApprove(
                                scheduleC.schedulesList[index]);
                            print("=================> $res");
                            if (res["status"] == 201) {
                              scheduleC.fetchSchedules();
                              Get.snackbar(
                                "Message",
                                res["message"],
                                backgroundColor: Color(0xff0A84FF),
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 2),
                                animationDuration: Duration(milliseconds: 500),
                                colorText: Colors.white,
                              );
                            }
                          },
                          child: "Approve"
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              .make(),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Coolors.secondaryBtn),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(10)),
                          ),
                        ),
                      ],
                    );
                  });
              return res;
            } else {
              print("right =>>>>>>>>>>>>>>>>>>>");
              Get.bottomSheet(PostponeApp(
                schedule: scheduleC.schedulesList[index],
              ));
              return null;
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
                    height: media.height * 0.11,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data[index]
                                .name
                                .toString()
                                .text
                                .size(media.height * 0.024 - 5)
                                .color(Color(0xff00ADB5))
                                .make(),
                            data[index]
                                .treatment
                                .toString()
                                .text
                                .size(media.height * 0.02 - 5)
                                .white
                                .make(),
                            data[index]
                                .visit
                                .toString()
                                .text
                                .size(media.height * 0.02 - 5)
                                .color(Color(0xffA8A3A3))
                                .make(),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              data[index]
                                  .state
                                  .toString()
                                  .text
                                  .size(media.height * 0.024 - 5)
                                  .color(Color(0xff00ADB5))
                                  .make(),
                              data[index]
                                  .time
                                  .toString()
                                  .text
                                  .size(media.height * 0.02 - 5)
                                  .white
                                  .make(),
                              data[index]
                                  .insuredStatus
                                  .toString()
                                  .text
                                  .size(media.height * 0.02 - 5)
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
                  fontSize: MediaQuery.of(context).size.height * 0.025 - 5),
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
              size: MediaQuery.of(context).size.height * 0.03 - 5,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              // color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.6 - 5,
              height: MediaQuery.of(context).size.height * 0.04 - 5,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => 10.widthBox,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      // width: MediaQuery.of(context).size.height * 0.033,
                      height: MediaQuery.of(context).size.height * 0.033 - 5,
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
