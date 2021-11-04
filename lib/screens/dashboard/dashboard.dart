// import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/controllers/dashboard.dart';
import 'package:tooth/models/todaysApp.dart';
import 'package:tooth/screens/dashboard/add_clinic.dart';
import 'package:tooth/screens/dashboard/address_list.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
import 'package:get/get.dart';
import 'package:tooth/widgets/refresh_indicator.dart';
// import 'package:tooth/screens/dashboard/medication.dart';
// import 'package:tooth/widgets/custome_date_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController dashboardC = Get.put(DashboardController());
  final CarouselController _controller = CarouselController();
  int _current = 0;
  DateTime lastPressed;
  final drName = Get.arguments;
  List<TodaysApp> filteredData = [];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Dashboard".text.size(media.height * 0.02 - 5).make(),
        backgroundColor: Color(0xff1F2125),
        automaticallyImplyLeading: false,
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(Icons.menu_rounded),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.settings,
                  size: 26.0,
                ),
              )),
        ],
      ),
      // drawer: Drawer(
      //   child: Column(children: <Widget>[
      //     SizedBox(
      //       height: 30,
      //     ),
      //     DrawerHeader(
      //       child: Container(
      //           color: Coolors.bgColorT,
      //           height: 142,
      //           width: MediaQuery.of(context).size.width,
      //           child: Image.asset(
      //             "assets/doctors_1x.png",
      //           )),
      //       decoration: BoxDecoration(
      //         color: Colors.transparent,
      //       ),
      //     ),
      //   ]),
      // ),
      backgroundColor: Color(0xff161819),
      bottomNavigationBar:
          // SizedBox(
          //   height: 45,
          //   child: BottomNavigationBar(
          //     backgroundColor: Color(0xff1F2125),
          //     iconSize: 18,
          //     type: BottomNavigationBarType.fixed,
          //     unselectedFontSize: 10,
          //     selectedFontSize: 10,
          //     currentIndex: 0,
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
                height: 45,
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
                      style: TextStyle(color: Colors.blue, fontSize: 9),
                    )
                  ],
                ),
              ).pOnly(left: 10, top: 5),
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
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastPressed == null || now.difference(lastPressed) > maxDuration;

          if (isWarning) {
            lastPressed = DateTime.now();

            final snackBar = SnackBar(
              content: Text('Press Back Again To Close App'),
              duration: maxDuration,
            );

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackBar);

            return false;
          } else {
            return true;
          }
        },
        child: SafeArea(
          child: RefreshWidget(
            onRefresh: dashboardC.fetchData,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
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
                              .size(media.height * 0.02 - 5)
                              .color(Color(0xff0A84FF))
                              .make(),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(AddressListPage(
                              cb: (data, isSelected) {
                                isSelected
                                    ? filteredData +=
                                        dashboardC.todaysApp.filter((element) {
                                        return element.addressName ==
                                            data.addressName;
                                      }).toList()
                                    : filteredData =
                                        filteredData.filter((element) {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              "Welcome Dr. $drName"
                                  .text
                                  .size(media.height * 0.025 - 5)
                                  .color(Color(0xff00BCD4))
                                  .make(),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(context, "/schedule");
                                  Get.toNamed("/patients");
                                },
                                child: buildCard(
                                  context: context,
                                  header: "Total Patient",
                                  price: "totalPatient", //"234",
                                  icon: 'assets/user-friends.png',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(context, "/schedule");
                                  Get.toNamed("/schedule");
                                },
                                child: buildCard(
                                  context: context,
                                  header: "Appointment",
                                  price: "appointments", //"234",
                                  icon: 'assets/patient.png',
                                ),
                              ),
                            ],
                          ),
                          10.heightBox,
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.pushNamed(context, "/schedule");
                                  Get.toNamed("/incomeDetails");
                                },
                                child: buildCard(
                                    context: context,
                                    header: "Total Income",
                                    price: "totalIncome" //"2.34K",
                                    ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () {
                                    // Navigator.pushNamed(context, "/expenditureDetails");
                                    Get.toNamed("/expenditureDetails");
                                  },
                                  child: buildCard(
                                      context: context,
                                      header: "Total Expense",
                                      price: "totalExpense" //"2.34K",
                                      )),
                            ],
                          ),
                          10.heightBox,
                          "Today's Appointment"
                              .text
                              .size(media.height * 0.02)
                              .color(Color(0xffCECECE))
                              .make(),
                          10.heightBox,
                          Obx(() {
                            if (dashboardC.isLoading.value)
                              return Center(child: CircularProgressIndicator());
                            else if (dashboardC.todaysApp.length == 0)
                              return "No appointments available"
                                  .text
                                  .color(Color(0xff646262))
                                  .make();
                            else
                              return CarouselSlider(
                                items: generateSlider(
                                    filteredData.length > 0
                                        ? filteredData
                                        : dashboardC.todaysApp,
                                    context),
                                carouselController: _controller,
                                options: CarouselOptions(
                                  autoPlay: false,
                                  height: (media.height * 0.09 + 10 - 5) * 2.2,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                ),
                              );
                          }),
                          5.heightBox,
                          Obx(() {
                            return generateIndicators(
                                filteredData.length > 0
                                    ? filteredData
                                    : dashboardC.todaysApp,
                                context);
                          }),
                          // buildFullWidthBox(context),
                          // 10.heightBox,
                          // buildFullWidthBox(context),
                          10.heightBox,
                          Image.asset(
                            'assets/showcase.png',
                            height: media.height * 0.1 - 5,
                            fit: BoxFit.contain,
                          ).centered(),
                          // Container(
                          //   color: Colors.white,
                          //   height: 100,
                          //   width: 100,
                          // ).centered(),
                          10.heightBox,
                          Align(
                            alignment: Alignment.center,
                            child:
                                "OOPS!!! no clinic Address has been added. Please add to sync your dashboard...."
                                    .text
                                    .size(media.height * 0.02 - 5)
                                    .center
                                    .color(Color(0xff989696))
                                    .make(),
                          ),

                          // AutoSizeText(
                          //   "OOPS!!! no clinic Address has been added. Please add to sync your dashboard....",
                          //   style: TextStyle(color: Color(0xff989696)),
                          //   maxLines: 1,
                          //   minFontSize: (media.height * 0.03),
                          //   textAlign: TextAlign.center,
                          // ).centered(),
                          10.heightBox,
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddClinicPage()));
                            },
                            child: "Add Clinic Address"
                                .text
                                .size(media.height * 0.02 - 5)
                                .make(),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Coolors.secondaryBtn),
                            ),
                          )
                              .wh(media.width * 0.5 - 5,
                                  media.height * 0.05 - 5)
                              .centered(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect buildCard(
      {BuildContext context, String header, String price, String icon = ""}) {
    final media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header.text
                      .size(media.height * 0.02 - 5)
                      .color(Color(0xff00ADB5))
                      .make(),
                  5.heightBox,
                  Obx(() {
                    if (dashboardC.isLoading.value)
                      return SizedBox(
                        child: Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 3,
                        )),
                        height: 25.0,
                        width: 25.0,
                      );
                    else
                      return FittedBox(
                        fit: BoxFit.contain,
                        child: dashboardC.userStats[price]
                            .toString()
                            .text
                            .size(media.height * 0.029)
                            .color(Colors.white)
                            .make(),
                      );
                  })
                ],
              ),
              Spacer(),
              icon.isEmpty
                  ? Container()
                  : Expanded(
                      child: Image.asset(
                        icon,
                        height: media.height * 0.05 - 5,
                        fit: BoxFit.contain,
                        // width: media.width * 0.02,
                      ),
                    )
              // Icon(
              //   icon,
              //   size: 35,
              //   color: Color(0xff6B6C70),
              // ),
            ],
          ),
          color: Color(0xff1F2125),
          height: media.height * 0.11 - 3, //80,
          width: media.width * 0.5 - 10 - 5 // 160,
          ),
    );
  }

  ClipRRect buildFullWidthBox(
      BuildContext context, List<TodaysApp> _todaysApp, int i) {
    final media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () {
          Get.toNamed("/patientDetails",
              arguments: _todaysApp[i].name.toString());
        },
        child: Container(
                padding: EdgeInsets.all(10),
                color: Color(0xff1F2125),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _todaysApp[i]
                            .name
                            .toString()
                            .text
                            .size(media.height * 0.023 - 5)
                            .color(Color(0xff00ADB5))
                            .make(),
                        Spacer(),
                        _todaysApp[i]
                            .state
                            .toString()
                            .text
                            .size(media.height * 0.023 - 5)
                            .color(Color(0xff00ADB5))
                            .make(),
                      ],
                    ),
                    5.heightBox,
                    Row(
                      children: [
                        Image.asset(
                          'assets/small-teeth.png',
                          height: media.height * 0.036 - 5,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          'assets/big-teeth.png',
                          height: media.height * 0.036 - 5,
                          fit: BoxFit.contain,
                        ),
                        Spacer(),
                        _todaysApp[i]
                            .time
                            .toString()
                            .text
                            .size(media.height * 0.023 - 5)
                            .color(Color(0xffFFFFFF))
                            .make(),
                      ],
                    ),
                  ],
                ),
                height: media.height * 0.09 + 10 - 5 //80,
                )
            .wFull(context),
      ),
    );
  }

  List<Widget> generateSlider(
      List<TodaysApp> _todaysApp, BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < _todaysApp.length; i = i + 2) {
      list.add(Column(
        children: [
          buildFullWidthBox(context, _todaysApp, i),
          10.heightBox,
          (i + 1) < _todaysApp.length
              ? buildFullWidthBox(context, _todaysApp, i + 1)
              : Container()
        ],
      ));
    }
    return list;
  }

  Row generateIndicators(List<TodaysApp> _todaysApp, BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _todaysApp.asMap().entries.map((entry) {
        return (entry.key < (_todaysApp.length / 2).round())
            ? GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: media.height * 0.01 - 2, //6.0,
                  height: media.height * 0.01 - 2, //6.0,
                  margin: EdgeInsets.symmetric(horizontal: media.width * 0.01),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Color(0xff5C5E5E))
                        .withOpacity(_current == entry.key ? 1 : 0.4),
                  ),
                ),
              )
            : Container();
      }).toList(),
    );
  }
}
