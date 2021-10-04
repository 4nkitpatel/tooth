import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/controllers/Medication.dart';
import 'package:tooth/widgets/widgets.dart';
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
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                  text: 'Medication',
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
                "Suggested Searches"
                    .text
                    .size(media.height * 0.025 - 5)
                    .color(Color(0xffCECECE))
                    .make(),
                10.heightBox,
                Container(
                  height: media.height * 0.4,
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
                                height: media.height * 0.12,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        medicationC.medicationsList[index].name
                                            .text.white
                                            .size(media.height * 0.024 - 5)
                                            .make(),
                                        medicationC.medicationsList[index]
                                            .composition.text
                                            // .size(10)
                                            .size(media.height * 0.02 - 5)
                                            .white
                                            .make(),
                                        medicationC.medicationsList[index]
                                            .rantinine.text
                                            // .size(10)
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
                                      value: medicationC.isSelected[index],
                                      onChanged: (value) {
                                        if (value)
                                          Wgt.addMedicationDialog(context,
                                              (json) async {
                                            var data = await medicationC
                                                .onMedication(json);
                                            print(data); // message
                                          });
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
