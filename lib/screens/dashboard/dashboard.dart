import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/screens/dashboard/add_clinic.dart';
import 'package:tooth/screens/dashboard/address_list.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
// import 'package:tooth/screens/dashboard/medication.dart';
// import 'package:tooth/widgets/custome_date_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

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
              child: ImageIcon(
                AssetImage('assets/nav-boy.png'),
                size: 40,
                color: Color(0xffA6A6A6),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Get.toNamed("/schedule");
              },
              child: ImageIcon(
                AssetImage('assets/nav-calendar.png'),
                size: 40,
                color: Color(0xffA6A6A6),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Get.toNamed("/patients");
              },
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
                size: 30,
                color: Color(0xffA6A6A6),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
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
                        Get.bottomSheet(AddressListPage());
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
                Row(
                  children: [
                    "Welcome Dr. Bens"
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
                        price: "234",
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
                        price: "234",
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
                        price: "2.34K",
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
                          price: "2.34K",
                        )),
                  ],
                ),
                20.heightBox,
                "Today's Appointment"
                    .text
                    .size(18)
                    .color(Color(0xffCECECE))
                    .make(),
                10.heightBox,
                buildFullWidthBox(context),
                10.heightBox,
                buildFullWidthBox(context),
                10.heightBox,
                Image.asset(
                  'assets/showcase.png',
                  height: media.height * 0.15 - 5,
                  fit: BoxFit.contain,
                ).centered(),
                // Container(
                //   color: Colors.white,
                //   height: 100,
                //   width: 100,
                // ).centered(),
                10.heightBox,
                "OOPS!!! no clinic Address has been added. Please add to sync your dashboard...."
                    .text
                    .size(media.height * 0.02 - 5)
                    .center
                    .color(Color(0xff989696))
                    .make(),
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
                    backgroundColor:
                        MaterialStateProperty.all(Coolors.secondaryBtn),
                  ),
                ).wh(media.width * 0.5 - 5, media.height * 0.05 - 5).centered(),
              ],
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
                  FittedBox(
                    fit: BoxFit.contain,
                    child: price.text
                        .size(media.height * 0.029)
                        .color(Colors.white)
                        .make(),
                  )
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
          height: media.height * 0.11 - 5, //80,
          width: media.width * 0.5 - 10 - 5 // 160,
          ),
    );
  }

  ClipRRect buildFullWidthBox(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () {
          // Navigator.pushNamed(context, "/patientDetails");
          Get.toNamed("/patientDetails", arguments: "Andy Murray");
        },
        child: Container(
                padding: EdgeInsets.all(10),
                color: Color(0xff1F2125),
                child: Column(
                  children: [
                    Row(
                      children: [
                        "Andy Murray"
                            .text
                            .size(media.height * 0.025 - 5)
                            .color(Color(0xff00ADB5))
                            .make(),
                        Spacer(),
                        "Arizona"
                            .text
                            .size(media.height * 0.025 - 5)
                            .color(Color(0xff00ADB5))
                            .make(),
                      ],
                    ),
                    5.heightBox,
                    Row(
                      children: [
                        Image.asset(
                          'assets/small-teeth.png',
                          height: media.height * 0.05 - 5,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          'assets/big-teeth.png',
                          height: media.height * 0.05 - 5,
                          fit: BoxFit.contain,
                        ),
                        // Icon(
                        //   Icons.accessibility_outlined,
                        //   color: Color(0xffCECECE),
                        // ),
                        // Icon(
                        //   Icons.accessibility_rounded,
                        //   color: Colors.white,
                        //   size: 35,
                        // ),
                        Spacer(),
                        "7:30 PM"
                            .text
                            .size(media.height * 0.02 - 5)
                            .color(Color(0xffFFFFFF))
                            .make(),
                      ],
                    ),
                  ],
                ),
                height: media.height * 0.11 + 10 - 5 //80,
                )
            .wFull(context),
      ),
    );
  }
}
