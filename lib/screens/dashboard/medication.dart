import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controllers/Medication.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class MedicationPage extends StatefulWidget {
  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  final MedicationController medicationC = Get.put(MedicationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
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
                "Suggested Searches".text.color(Color(0xffCECECE)).make(),
                10.heightBox,
                Container(
                  height: 350,
                  // color: Colors.red,
                  child: Obx(
                    () {
                      if (medicationC.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else if (medicationC.medicationsList.length == 0)
                        return "No data available"
                            .text
                            .color(Color(0xff646262))
                            .make();
                      else
                        return ListView.separated(
                          separatorBuilder: (context, index) => 10.heightBox,
                          itemCount: medicationC.medicationsList.length,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        medicationC.medicationsList[index].name
                                            .text.white
                                            .make(),
                                        medicationC.medicationsList[index]
                                            .composition.text
                                            .size(10)
                                            .white
                                            .make(),
                                        medicationC.medicationsList[index]
                                            .rantinine.text
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
                                      value: medicationC.isSelected[index],
                                      onChanged: (value) {
                                        setState(() {
                                          medicationC.isSelected[index] = value;
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
