import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tooth/controllers/Expenditures.dart';
import 'package:tooth/widgets/pichart.dart';
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
  int initialIndex = 0;
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
                Get.toNamed("/patientDetails");
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
                    top: 21,
                    left: 105,
                    child: Container(
                      height: 130,
                      width: 130,
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
                          .headline6(context)
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
                20.heightBox,
                Container(
                    height: 280,
                    // color: Colors.red,
                    child: (() {
                      if (builderFor == 'expenditure')
                        return buildObxForExpenditures();
                      else
                        return buildObxForMaterials();
                    }())),
                10.heightBox,
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

  Obx buildObxForExpenditures() {
    return Obx(() {
      if (expendituresC.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.separated(
          separatorBuilder: (context, index) => 10.heightBox,
          itemCount: expendituresC.expendituresList.length,
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
                        expendituresC.expendituresList[index].labName.text
                            .color(Color(0xff00ADB5))
                            .make(),
                        expendituresC.expendituresList[index].price.text
                            .size(10)
                            .white
                            .make(),
                        expendituresC.expendituresList[index].paymentMode.text
                            .size(10)
                            .color(Color(0xffBBBBBB))
                            .make(),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        expendituresC.expendituresList[index].state.text
                            .color(Color(0xff00ADB5))
                            .make(),
                        expendituresC.expendituresList[index].time.text
                            .size(10)
                            .white
                            .make(),
                        expendituresC.expendituresList[index].date.text
                            .size(10)
                            .white
                            .make(),
                      ],
                    ),
                  ],
                ).p8(),
              ),
            );
          },
        );
    });
  }

  Obx buildObxForMaterials() {
    return Obx(() {
      if (expendituresC.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.separated(
          separatorBuilder: (context, index) => 10.heightBox,
          itemCount: expendituresC.materialList.length,
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
                        expendituresC.materialList[index].materialName.text
                            .color(Color(0xff00ADB5))
                            .make(),
                        expendituresC.materialList[index].price.text
                            .size(10)
                            .white
                            .make(),
                        expendituresC.materialList[index].paymentMode.text
                            .size(10)
                            .color(Color(0xffBBBBBB))
                            .make(),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        expendituresC.materialList[index].state.text
                            .color(Color(0xff00ADB5))
                            .make(),
                        expendituresC.materialList[index].time.text
                            .size(10)
                            .white
                            .make()
                      ],
                    ),
                  ],
                ).p8(),
              ),
            );
          },
        );
    });
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
