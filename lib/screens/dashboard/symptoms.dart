import 'package:flutter/material.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              text: "Mr. Andy \n",
              style: TextStyle(
                fontSize: 17,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Complaints',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
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
                TextFormField(
                  style: TextStyle(color: Color(0xff00ADB5)),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Color(0xff00ADB5)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    focusColor: Color(0xff393E46),
                    hoverColor: Color(0xff393E46),
                    contentPadding: EdgeInsets.only(left: 20),
                    fillColor: Color(0xff393E46),
                  ),
                ),
                20.heightBox,
                "Upper Left Maxila".text.headline6(context).white.make(),
                10.heightBox,
                "Advice List".text.color(Color(0xffCECECE)).make(),
                10.heightBox,
                Container(
                  height: 350,
                  // color: Colors.red,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => 10.heightBox,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Color(0xff2C2C2E),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Cavity".text.white.make(),
                                    "Cavities are permanently damaged areas in the hard surface of your teeth that develop into tiny openings or holes"
                                        .text
                                        .size(10)
                                        .color(Color(0xffEBEBF599))
                                        .make(),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Radio(
                                activeColor: Colors.red,
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                value: index,
                                groupValue: -1,
                                onChanged: (value) {
                                  print(value);
                                },
                              ),
                            ],
                          ).p8(),
                        ),
                      );
                    },
                  ),
                ),
                "Teeth Number".text.color(Color(0xffCECECE)).make(),
                5.heightBox,
                Container(
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 10.widthBox,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Container(
                          color: index == 2 ? Color(0xff0A84FF) : Colors.white,
                          width: 33,
                          child: (index + 1).text.make().centered(),
                        ),
                      );
                    },
                  ),
                ),
                10.heightBox,
                "Severity".text.color(Color(0xffCECECE)).make(),
                10.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.white,
                  child: Slider(
                    activeColor: Color(0xff007AFF),
                    value: sliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        sliderValue = newValue;
                      });
                    },
                    min: 0,
                    max: 100,
                  ),
                ),
                20.heightBox,
                Wgt.getPrimaryBtn(
                  text: 'Add More O/E',
                  context: context,
                  cb: () {
                    Navigator.pushNamed(context, "/expenditureDetails");
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
