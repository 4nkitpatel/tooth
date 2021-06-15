import 'package:flutter/material.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  double sliderValue = 0;
  List<bool> isTeethSelected = List.generate(8, (i) => false).toList();
  List<bool> _value = List<bool>.filled(3, false).toList();
  // int _value = 0;
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
                                        .color(Color(0xff616165))
                                        .make(),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Checkbox(
                                shape: CircleBorder(),
                                fillColor: MaterialStateProperty.all(
                                    Color(0xff0A84FF)),
                                value: _value[index],
                                onChanged: (value) {
                                  setState(() {
                                    _value[index] = value;
                                  });
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
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 10.widthBox,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTeethSelected[index]
                                ? Color(0xff0A84FF)
                                : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          // alignment: Alignment.center,
                          // color: Colors.green,
                          width: 33,
                          height: 35,
                          // color: Colors.white,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            selected: isTeethSelected[index],
                            // selectedTileColor: Color(0xff0A84FF),
                            title: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                    color: isTeethSelected[index]
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                isTeethSelected[index] =
                                    !isTeethSelected[index];
                              });
                            },
                          ).centered(),
                        ),
                      );
                    },
                  ),
                ),
                10.heightBox,
                "Severity".text.color(Color(0xffCECECE)).make(),
                10.heightBox,
                SliderTheme(
                  data: SliderThemeData(
                    thumbColor: Colors.white,
                    activeTrackColor: Color(0xff007AFF),
                  ),
                  child: Slider(
                    // activeColor: Color(0xff007AFF),
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
                10.heightBox,
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
