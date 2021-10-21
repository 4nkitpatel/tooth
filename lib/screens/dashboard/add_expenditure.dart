import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
import 'package:tooth/screens/dashboard/medication.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AddExpenditure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      child: "Wed, May 31".text.color(Color(0xff0A84FF)).make(),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(MedicationPage());
                      },
                      child: "All Clinics".text.color(Color(0xff0A84FF)).make(),
                    )
                  ],
                ),
                50.heightBox,
                Placeholder(
                  color: Colors.white,
                  fallbackHeight: 300,
                  fallbackWidth: MediaQuery.of(context).size.width,
                ),
                30.heightBox,
                AutoSizeText(
                  "OOPS!!! No Expenses are added to this branch.Please add if you missed it.Adding expenses help you track and budgeting for the month.",
                  style: TextStyle(color: Color(0xff989696)),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ).centered(),
                20.heightBox,
                Wgt.getSecondaryBtn(
                  text: 'Add Expense',
                  context: context,
                  cb: () {
                    // Navigator.pushNamed(context, "/patients");
                    Get.toNamed("/patients");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
