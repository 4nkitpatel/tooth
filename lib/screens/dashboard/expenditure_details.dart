import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tooth/controllers/Expenditures.dart';
import 'package:tooth/screens/dashboard/address_list.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
import 'package:tooth/screens/dashboard/medication.dart';
import 'package:tooth/widgets/pichart.dart';
import 'package:tooth/widgets/refresh_indicator.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class ExpenditureDetailsPage extends StatefulWidget {
  @override
  _ExpenditureDetailsPageState createState() => _ExpenditureDetailsPageState();
}

class _ExpenditureDetailsPageState extends State<ExpenditureDetailsPage> {
  final ExpendituresController expendituresC =
      Get.put(ExpendituresController());
  int touchedIndex = -1;
  String builderFor = 'expenditure';
  List<dynamic> filteredData = [];
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: "Expenditure Details".text.size(15).white.make(),
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
        bottomNavigationBar:
            // SizedBox(
            //   height: 45,
            //   child: BottomNavigationBar(
            //     backgroundColor: Color(0xff1F2125),
            //     iconSize: 18,
            //     type: BottomNavigationBarType.fixed,
            //     unselectedFontSize: 10,
            //     selectedFontSize: 10,
            //     items: [
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             Get.toNamed("/dashboard");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/nav-boy.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "Dashboard",
            //         // backgroundColor: Color(0xff1F2125),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             Get.toNamed("/schedule");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/nav-calendar.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "Appointment",
            //         // backgroundColor: Color(0xff1F2125),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             Get.toNamed("/patients");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/nav-laddy.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "Patients",
            //         // backgroundColor: Color(0xff1F2125),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             // Get.toNamed("/patients");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/more_icon.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "More",
            //       ),
            //     ],
            //   ),
            // ),
            BottomAppBar(
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
                  height: 40,
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
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      )
                    ],
                  ),
                ),
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
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          height: media.height,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                        height: 300,
                        child: ChooseTime(),
                      ));
                    },
                    child: "Wed, May 31"
                        .text
                        .size(media.height * 0.023 - 5)
                        .color(Color(0xff0A84FF))
                        .make(),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(AddressListPage(
                        cb: (data, isSelected) {
                          List list = builderFor == 'expenditure'
                              ? expendituresC.expendituresList
                              : expendituresC.materialList;
                          isSelected
                              ? filteredData += list.filter((element) {
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
                        .size(media.height * 0.023 - 5)
                        .color(Color(0xff0A84FF))
                        .make(),
                  )
                ],
              ),
              Stack(clipBehavior: Clip.none, children: [
                PieChartSample2(),
                // Positioned(
                //   top: 21,
                //   left: 105,
                //   child: Container(
                //     height: 130,
                //     width: 130,
                //     decoration: BoxDecoration(
                //       border: Border.all(
                //           // style: BorderStyle.solid,
                //           // width: 20,
                //           // color: Colors.red[500],
                //           ),
                //       color: Color(0xff161819),
                //       shape: BoxShape.circle,
                //     ),
                //     child: "34,890"
                //         .text
                //         .headline6(context)
                //         .color(Color(0xff1F78B4))
                //         .make()
                //         .centered(),
                //   ),
                // ),
              ]),
              20.heightBox,
              Container(
                color: Color(0xff1F2125),
                height: media.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: ToggleSwitch(
                  minHeight: media.height * 0.04,
                  minWidth: MediaQuery.of(context).size.width,
                  initialLabelIndex: initialIndex,
                  inactiveBgColor: Color(0xff34353B),
                  activeBgColor: Color(0xff636366),
                  inactiveFgColor: Colors.white,
                  labels: ['Labdetails', 'Materials', 'Misc'],
                  onToggle: (index) {
                    print('switched to: $index');
                    if (index == 1) {
                      expendituresC.fetchMaterials();
                      setState(() {
                        builderFor = 'materail';
                        initialIndex = index;
                      });
                    } else if (index == 2) {
                      // call api
                      setState(() {
                        builderFor = 'expenditure';
                        initialIndex = index;
                      });
                    } else {
                      setState(() {
                        builderFor = 'expenditure';
                        initialIndex = index;
                      });
                    }
                  },
                ).centered(),
              ),
              10.heightBox,
              Expanded(
                child: Container(
                    height: media.height * 0.29 - 3,
                    // color: Colors.red,
                    child: (() {
                      if (builderFor == 'expenditure')
                        return RefreshWidget(
                          child: buildObxForExpenditures(context),
                          onRefresh: expendituresC.fetchExpenditures,
                        );
                      else
                        return RefreshWidget(
                          child: buildObxForMaterials(context),
                          onRefresh: expendituresC.fetchMaterials,
                        );
                    }())),
              ),
              5.heightBox,
              Wgt.getSecondaryBtn(
                text: 'Add Expense',
                context: context,
                cb: () {
                  // Navigator.pushNamed(context, "/patients");
                  // Get.toNamed("/patients");
                  Wgt.addExpenseDialog(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Obx buildObxForExpenditures(BuildContext context) {
    var data =
        filteredData.length > 0 ? filteredData : expendituresC.expendituresList;
    return Obx(() {
      if (expendituresC.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.separated(
          separatorBuilder: (context, index) => 10.heightBox,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed("/patientDetails");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Color(0xff1F2125),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data[index]
                              .labName
                              .toString()
                              .text
                              .size(MediaQuery.of(context).size.height * 0.024 -
                                  5)
                              .color(Color(0xff00ADB5))
                              .make(),
                          data[index]
                              .price
                              .toString()
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              // .size(10)
                              .white
                              .make(),
                          data[index]
                              .paymentMode
                              .toString()
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              // .size(10)
                              .color(Color(0xffBBBBBB))
                              .make(),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data[index]
                              .state
                              .toString()
                              .text
                              .size(MediaQuery.of(context).size.height * 0.024 -
                                  5)
                              .color(Color(0xff00ADB5))
                              .make(),
                          data[index]
                              .time
                              .toString()
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              // .size(10)
                              .white
                              .make(),
                          data[index]
                              .date
                              .toString()
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              // .size(10)
                              .white
                              .make(),
                        ],
                      ),
                    ],
                  ).p8(),
                ),
              ),
            );
          },
        );
    });
  }

  Obx buildObxForMaterials(BuildContext context) {
    var data =
        filteredData.length > 0 ? filteredData : expendituresC.materialList;
    return Obx(() {
      if (expendituresC.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.separated(
          separatorBuilder: (context, index) => 10.heightBox,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed("/patientDetails");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Color(0xff1F2125),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1 + 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data[index]
                              .materialname
                              .toString()
                              .text
                              .size(MediaQuery.of(context).size.height * 0.024 -
                                  5)
                              .color(Color(0xff00ADB5))
                              .make(),
                          ("Rs ${data[index].price}")
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              // .size(10)
                              .white
                              .make(),
                          data[index]
                              .paymentmode
                              .toString()
                              .text
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              // .size(10)
                              .color(Color(0xffBBBBBB))
                              .make(),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data[index]
                              .state
                              .toString()
                              .text
                              .size(MediaQuery.of(context).size.height * 0.024 -
                                  5)
                              .color(Color(0xff00ADB5))
                              .make(),
                          readableDate(data[index].time)
                              .text
                              // .size(10)
                              .size(
                                  MediaQuery.of(context).size.height * 0.02 - 5)
                              .white
                              .make()
                        ],
                      ),
                    ],
                  ).p8(),
                ),
              ),
            );
          },
        );
    });
  }

  String readableDate(String inputDate) {
    var a = DateTime.parse(inputDate).toLocal();
    print("${a.day}/${a.month}/${a.year} ${a.hour}:${a.minute}");
    var date = "${a.day}/${a.month}/${a.year} ${a.hour}:${a.minute}";
    return date;
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
