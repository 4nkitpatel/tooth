import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/screens/dashboard/advice.dart';
import 'package:velocity_x/velocity_x.dart';

class PatientDetailsPage extends StatelessWidget {
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
          body: SafeArea(
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
                      Image.asset('assets/calendar.png'),
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
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, "/symptoms");
                          Get.toNamed("/symptoms");
                        },
                        child: buildCard(),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, "/symptoms");
                          Get.toNamed("/symptoms");
                        },
                        child: buildCardWithText(text: "Upper Right"),
                      ),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed("/symptoms");
                          // Navigator.pushNamed(context, "/symptoms");
                        },
                        child: buildCardWithText(text: "Lower Left"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/symptoms");
                          // Navigator.pushNamed(context, "/symptoms");
                        },
                        child: buildCardWithText(text: "Lower Right"),
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
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xff1F2125),
                        height: 26,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            "Root Canal".text.color(Color(0xff00ADB5)).make(),
                            Spacer(),
                            "1000 INR".text.color(Colors.white).make(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xff39393A),
                        height: 26,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            "Filling".text.color(Color(0xff00ADB5)).make(),
                            Spacer(),
                            "1000 INR".text.color(Colors.white).make(),
                          ],
                        ),
                      ),
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
                              onPressed: () {},
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
}

ClipRRect buildCardWithText({String text}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
      padding: EdgeInsets.all(10),
      child: text.text.size(20).color(Color(0xff646262)).make().centered(),
      color: Color(0xff1F2125),
      height: 150,
      width: 160,
    ),
  );
}

ClipRRect buildCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
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
      color: Color(0xff1F2125),
      height: 150,
      width: 160,
    ),
  );
}
