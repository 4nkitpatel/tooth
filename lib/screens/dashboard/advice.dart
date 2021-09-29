import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/controllers/AdviceList.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class AdvicePage extends StatefulWidget {
  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  // TODO may be image should also come from BE
  List iconImagePath = [
    'assets/rootcanal.png',
    'assets/braces.png',
    'assets/filling.png',
    'assets/rootcanal.png',
    'assets/braces.png'
  ];
  final AdviceListController adviceC = Get.put(AdviceListController());
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              text: "Mr. Andy \n",
              style: TextStyle(
                fontSize: media.height * 0.02,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Advice',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: media.height * 0.015,
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
                .size(media.height * 0.02 - 5)
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
                  .size(media.height * 0.02 - 5)
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
                  onChanged: (String text) {
                    print(text);
                  },
                ),
                20.heightBox,
                "Advice List"
                    .text
                    .size(media.height * 0.024 - 5)
                    .color(Color(0xffCECECE))
                    .make(),
                10.heightBox,
                Container(
                  height: media.height * 0.55, // 350,
                  // color: Colors.red,
                  child: Obx(() {
                    if (adviceC.isLoading.value)
                      return Center(child: CircularProgressIndicator());
                    else if (adviceC.adviceList.length == 0)
                      return "No data available"
                          .text
                          .color(Color(0xff646262))
                          .make()
                          .centered();
                    else
                      return ListView.separated(
                        separatorBuilder: (context, index) => 10.heightBox,
                        itemCount: adviceC.adviceList.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Color(0xff2C2C2E),
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(iconImagePath[index]),
                                  10.widthBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      adviceC.adviceList[index].name.text
                                          .size(media.height * 0.023 - 5)
                                          .white
                                          .make(),
                                      "Price"
                                          .text
                                          .size(media.height * 0.02 - 5)
                                          .white
                                          .make(),
                                      adviceC.adviceList[index].price.text
                                          .size(media.height * 0.02 - 5)
                                          .color(Color(0xff9F9FA5))
                                          .make(),
                                    ],
                                  ),
                                  Spacer(),
                                  Checkbox(
                                    shape: CircleBorder(),
                                    fillColor: MaterialStateProperty.all(
                                        Color(0xff0A84FF)),
                                    value: adviceC.isSelected[index],
                                    onChanged: (value) {
                                      setState(() {
                                        adviceC.isSelected[index] = value;
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
                      );
                  }),
                ),
                10.heightBox,
                Wgt.getPrimaryBtn(
                  text: 'Add Custom Advice',
                  context: context,
                  cb: () {
                    // Navigator.pushNamed(context, "/symptoms");
                    // Get.toNamed("/symptoms");
                    // TODO dialogBox issue in big screen
                    Container(
                        // height: media.height * 0.3,
                        // width: media.width * 0.2,
                        // color: Colors.red,
                        child: Wgt.showDialog(context));
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
