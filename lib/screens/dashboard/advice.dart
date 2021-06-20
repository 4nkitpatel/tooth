import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AdvicePage extends StatefulWidget {
  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  List<bool> _value = List<bool>.filled(3, false).toList();
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
                  text: 'Advice',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Root Canal".text.white.make(),
                                  "Price".text.size(10).white.make(),
                                  "30000"
                                      .text
                                      .size(10)
                                      .color(Color(0xff9F9FA5))
                                      .make(),
                                ],
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
                              // Radio(
                              //   activeColor: Colors.red,
                              //   fillColor:
                              //       MaterialStateProperty.all(Colors.white),
                              //   value: index,
                              //   groupValue: -1,
                              //   onChanged: (value) {
                              //     print(value);
                              //   },
                              // ),
                            ],
                          ).p8(),
                        ),
                      );
                    },
                  ),
                ),
                Wgt.getPrimaryBtn(
                  text: 'Add Custom Advice',
                  context: context,
                  cb: () {
                    // Navigator.pushNamed(context, "/symptoms");
                    Get.toNamed("/symptoms");
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
