import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tooth/colors.dart';
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
                      buildCard(),
                      SizedBox(
                        width: 10,
                      ),
                      buildCard(),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      buildCard(),
                      SizedBox(
                        width: 10,
                      ),
                      buildCard(),
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
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      10.heightBox,
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xff1F2125),
                        height: 25,
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
                        height: 25,
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
                  10.heightBox,
                  // buildFullWidthBox(context),
                  10.heightBox,
                  // buildFullWidthBox(context),
                ],
              ),
            ),
          )),
    );
  }
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
      height: 160,
      width: 160,
    ),
  );
}
