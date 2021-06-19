import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tooth/widgets/pichart.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpenditureDetailsPage extends StatefulWidget {
  @override
  _ExpenditureDetailsPageState createState() => _ExpenditureDetailsPageState();
}

class _ExpenditureDetailsPageState extends State<ExpenditureDetailsPage> {
  int touchedIndex = -1;
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
              onTap: () {},
              child: "Done"
                  .text
                  .center
                  .color(Color(0xff007AFF))
                  .make()
                  .pOnly(top: 18, right: 16),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    "Wed, May 31".text.color(Color(0xff0A84FF)).make(),
                    Spacer(),
                    "All Clinics".text.color(Color(0xff0A84FF)).make(),
                  ],
                ),
                Stack(clipBehavior: Clip.none, children: [
                  PieChartSample2(),
                  Positioned(
                    top: 28,
                    left: 85,
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                            // style: BorderStyle.solid,
                            // width: 20,
                            // color: Colors.red[500],
                            ),
                        color: Color(0xff161819),
                        shape: BoxShape.circle,
                      ),
                      child: "34,890"
                          .text
                          .headline4(context)
                          .color(Color(0xff1F78B4))
                          .make()
                          .centered(),
                    ),
                  ),
                ]),
                20.heightBox,
                Container(
                  color: Color(0xff1F2125),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ToggleSwitch(
                    minHeight: 30,
                    minWidth: MediaQuery.of(context).size.width,
                    initialLabelIndex: 0,
                    inactiveBgColor: Color(0xff34353B),
                    activeBgColor: Color(0xff636366),
                    inactiveFgColor: Colors.white,
                    labels: ['Labdetails', 'Materials', 'Misc'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ).centered(),
                ),
                20.heightBox,
                Container(
                  height: 280,
                  // color: Colors.red,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => 10.heightBox,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Color(0xff1F2125),
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Technolabs"
                                      .text
                                      .color(Color(0xff00ADB5))
                                      .make(),
                                  "Rs 12,500".text.size(10).white.make(),
                                  "Cash"
                                      .text
                                      .size(10)
                                      .color(Color(0xffBBBBBB))
                                      .make(),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Arizona"
                                      .text
                                      .color(Color(0xff00ADB5))
                                      .make(),
                                  "7:30 PM".text.size(10).white.make(),
                                  "Jun 4".text.size(10).white.make(),
                                ],
                              ),
                            ],
                          ).p8(),
                        ),
                      );
                    },
                  ),
                ),
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
