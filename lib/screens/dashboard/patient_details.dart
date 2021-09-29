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
    final media = MediaQuery.of(context).size;
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
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: 'Attended By: ',
                                style: TextStyle(
                                    fontSize: media.height * 0.02 - 3,
                                    color: Color(0xff00BCD4)),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Dr. Andrew',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: media.height * 0.02 - 3),
                                  )
                                ]),
                          ),
                          Text.rich(
                            TextSpan(
                                text: 'Last Visit: ',
                                style: TextStyle(
                                    fontSize: media.height * 0.02 - 3,
                                    color: Color(0xff00BCD4)),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: '12-May-21',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: media.height * 0.02 - 3),
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
                        child: Image.asset(
                          'assets/calendar.png',
                          height: media.height * 0.055 - 5,
                          // width: media.height * 0.055 - 5,
                          fit: BoxFit.contain,
                        ),
                      ),
                      10.widthBox,
                      Image.asset(
                        'assets/file-prescription.png',
                        height: media.height * 0.055 - 5,
                        // width: media.height * 0.055 - 5,
                        fit: BoxFit.contain,
                      ),
                      10.widthBox,
                      Image.asset(
                        'assets/file-medical.png',
                        height: media.height * 0.055 - 5,
                        // width: media.height * 0.055 - 5,
                        fit: BoxFit.contain,
                      ),
                      10.widthBox,
                      Image.asset(
                        'assets/file-invoice.png',
                        height: media.height * 0.055 - 5,
                        // width: media.height * 0.06,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  20.heightBox,
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
                            child: buildCard(context),
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
                            child: buildCardWithText(
                                text: "Upper Right", context: context),
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
                              child: buildCardWithText(
                                  text: "Lower Left", context: context)),
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
                            child: buildCardWithText(
                                context: context, text: "Lower Right"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/medical report.png',
                            height: media.height * 0.045 - 5,
                            // width: media.height * 0.055 - 5,
                            fit: BoxFit.contain,
                          ),
                          10.widthBox,
                          "Advice"
                              .text
                              .size(media.height * 0.025)
                              .color(Color(0xffCECECE))
                              .make(),
                          Spacer(),
                          Container(
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: media.height * 0.03,
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
                        else if (adviceC.adviceList.length == 0)
                          return "No advice available"
                              .text
                              .color(Color(0xff646262))
                              .make();
                        else
                          return CarouselSlider(
                            items: generateSlider(adviceC.adviceList, context),
                            carouselController: _controller,
                            options: CarouselOptions(
                              autoPlay: false,
                              height: media.height * 0.09, //60,
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
                  // 20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.medical_services,
                            color: Color(0xff646464),
                            size: media.height * 0.045 - 5,
                          ),
                          10.widthBox,
                          "Medication"
                              .text
                              .size(media.height * 0.025)
                              .color(Color(0xffCECECE))
                              .make(),
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
                        height: media.height * 0.041, //26,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: media.width * 0.4, // 120,
                              child: "Orindazole 100mg"
                                  .text
                                  .size(media.height * 0.018)
                                  .color(Color(0xff00ADB5))
                                  .make(),
                            ),
                            "1Tab-TDS-BF"
                                .text
                                .size(media.height * 0.018)
                                .white
                                .make(),
                            "15 Days"
                                .text
                                .size(media.height * 0.018)
                                .color(Colors.white)
                                .make(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xff39393A),
                        height: media.height * 0.041, //26,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: media.width * 0.4,
                              child: "Rantine 200mg"
                                  .text
                                  .size(media.height * 0.018)
                                  .color(Color(0xff00ADB5))
                                  .make(),
                            ),
                            "1Tab-TDS-BF"
                                .text
                                .size(media.height * 0.018)
                                .white
                                .make(),
                            "15 Days"
                                .text
                                .size(media.height * 0.018)
                                .color(Colors.white)
                                .make(),
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
    final media = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: adviceC.adviceList.asMap().entries.map((entry) {
        return (entry.key < (adviceC.adviceList.length / 2).round())
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

  List<Widget> generateSlider(
      List<AdviceList> _adviceList, BuildContext context) {
    final media = MediaQuery.of(context).size;
    List<Widget> list = [];
    for (var i = 0; i < _adviceList.length; i = i + 2) {
      list.add(Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            color: Color(0xff1F2125),
            height: media.height * 0.041, //26,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                _adviceList[i]
                    .name
                    .text
                    .size(media.height * 0.018)
                    .color(Color(0xff00ADB5))
                    .make(),
                Spacer(),
                _adviceList[i]
                    .price
                    .text
                    .size(media.height * 0.018)
                    .color(Colors.white)
                    .make(),
              ],
            ),
          ),
          (i + 1) < _adviceList.length
              ? Container(
                  padding: EdgeInsets.all(5),
                  color: Color(0xff39393A),
                  height: media.height * 0.041,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      _adviceList[i + 1]
                          .name
                          .text
                          .size(media.height * 0.018)
                          .color(Color(0xff00ADB5))
                          .make(),
                      Spacer(),
                      _adviceList[i + 1]
                          .price
                          .text
                          .size(media.height * 0.018)
                          .color(Colors.white)
                          .make(),
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

Container buildCardWithText({BuildContext context, String text}) {
  final media = MediaQuery.of(context).size;
  return Container(
      padding: EdgeInsets.all(10),
      child: text.text
          .size(media.height * 0.025)
          .color(Color(0xff646262))
          .make()
          .centered(),
      // color: Color(0xff1F2125),
      height: media.height * 0.21, //150,
      width: media.width * 0.5 - 15 - 5 // 160,
      );
}

Container buildCard(BuildContext context) {
  final media = MediaQuery.of(context).size;
  return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          "Sensitivity,Swelling,Black Patch, Slacked"
              .text
              .size(media.height * 0.025 - 5)
              .color(Color(0xff00ADB5))
              .make(),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: "4,3"
                .text
                .size(media.height * 0.05)
                .end
                .color(Color(0xff646262))
                .make(),
          ),
        ],
      ),
      // color: Color(0xff060606),
      height: media.height * 0.21, //150,
      width: media.width * 0.5 - 15 - 5 // 160,
      );
}
