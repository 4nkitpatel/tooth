import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/controllers/AdviceList.dart';
import 'package:tooth/models/AdviceList.dart';
import 'package:tooth/screens/dashboard/advice.dart';
import 'package:tooth/screens/dashboard/medication.dart';
import 'package:tooth/services/api.service.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class PatientDetailsPage extends StatefulWidget {
  @override
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  final AdviceListController adviceC = Get.put(AdviceListController());
  int _current = 0;
  final CarouselController _controller = CarouselController();
  DateTime date;
  String getDateText() {
    if (date == null) {
      return "Select Date";
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year - 2),
    );
    if (newDate == null) return;
    setState(() => date = newDate);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff161819),
          appBar: AppBar(
            centerTitle: true,
            title: "Mr. Andy".text.size(17).make(),
            backgroundColor: Color(0xff1F2125),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: "Back"
                  .text
                  .center
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
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: 'Attended By: ',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff00BCD4)),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Dr. Andrew',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                          ),
                          Text.rich(
                            TextSpan(
                                text: 'Last Visit: ',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff00BCD4)),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '12-May-21',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print("asdasd");
                          pickDate(context);
                        },
                        child: Image.asset('assets/calendar.png'),
                      ),
                      10.widthBox,
                      Image.asset('assets/file-prescription.png'),
                      10.widthBox,
                      Image.asset('assets/file-medical.png'),
                      10.widthBox,
                      Image.asset('assets/file-invoice.png'),
                    ],
                  ),
                  30.heightBox,
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff060606),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/symptoms");
                            },
                            child: buildCard(),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     // Navigator.pushNamed(context, "/symptoms");
                      //     Get.toNamed("/symptoms");
                      //   },
                      //   child: buildCard(),
                      // ),
                      SizedBox(
                        width: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff1F2125),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/symptoms");
                            },
                            child: buildCardWithText(text: "Upper Right"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff1F2125),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/symptoms");
                            },
                            child: buildCardWithText(text: "Lower Left"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff1F2125),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/symptoms");
                            },
                            child: buildCardWithText(text: "Lower Right"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/medical report.png'),
                          10.widthBox,
                          "Advice".text.xl3.color(Color(0xffCECECE)).make(),
                          Spacer(),
                          Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.to(() => AdvicePage());
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => AdvicePage()),
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                      // 10.heightBox,
                      Obx(() {
                        if (adviceC.isLoading.value)
                          return Center(child: CircularProgressIndicator());
                        else
                          return CarouselSlider(
                            items: generateSlider(adviceC.adviceList),
                            carouselController: _controller,
                            options: CarouselOptions(
                              autoPlay: false,
                              height: 60,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                          );
                      }),
                      Obx(() {
                        return generateIndicators(context);
                      })
                    ],
                  ),
                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.medical_services,
                            color: Color(0xff646464),
                            size: 30,
                          ),
                          10.widthBox,
                          "Medication".text.xl3.color(Color(0xffCECECE)).make(),
                          Spacer(),
                          Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.to(() => MedicationPage());
                              },
                            ),
                          ),
                        ],
                      ),
                      // 10.heightBox,
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xff1F2125),
                        height: 26,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120,
                              child: "Orindazole 100mg"
                                  .text
                                  .color(Color(0xff00ADB5))
                                  .make(),
                            ),
                            "1Tab-TDS-BF".text.white.make(),
                            "15 Days".text.color(Colors.white).make(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xff39393A),
                        height: 26,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 120,
                              child: "Rantine 200mg"
                                  .text
                                  .color(Color(0xff00ADB5))
                                  .make(),
                            ),
                            "1Tab-TDS-BF".text.white.make(),
                            "15 Days".text.color(Colors.white).make(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Row generateIndicators(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: adviceC.adviceList.asMap().entries.map((entry) {
        return (entry.key < (adviceC.adviceList.length / 2).round())
            ? GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
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

  List<Widget> generateSlider(List<AdviceList> _adviceList) {
    List<Widget> list = [];
    for (var i = 0; i < _adviceList.length; i = i + 2) {
      list.add(Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            color: Color(0xff1F2125),
            height: 26,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                _adviceList[i].name.text.color(Color(0xff00ADB5)).make(),
                Spacer(),
                _adviceList[i].price.text.color(Colors.white).make(),
              ],
            ),
          ),
          (i + 1) < _adviceList.length
              ? Container(
                  padding: EdgeInsets.all(5),
                  color: Color(0xff39393A),
                  height: 26,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      _adviceList[i + 1]
                          .name
                          .text
                          .color(Color(0xff00ADB5))
                          .make(),
                      Spacer(),
                      _adviceList[i + 1].price.text.color(Colors.white).make(),
                    ],
                  ),
                )
              : Container()
        ],
      ));
    }
    return list;
  }
}

Container buildCardWithText({String text}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: text.text.size(20).color(Color(0xff646262)).make().centered(),
    // color: Color(0xff1F2125),
    height: 150,
    width: 160,
  );
}

Container buildCard() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        "Sensitivity,Swelling,Black Patch, Slacked"
            .text
            .color(Color(0xff00ADB5))
            .make(),
        Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: "4,3".text.xl5.end.color(Color(0xff646262)).make(),
        ),
      ],
    ),
    // color: Color(0xff060606),
    height: 150,
    width: 160,
  );
}
