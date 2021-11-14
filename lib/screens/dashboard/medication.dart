import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/controllers/Medication.dart';
import 'package:tooth/controllers/search.controller.dart';
import 'package:tooth/models/Medication.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class MedicationPage extends StatefulWidget {
  @override
  _MedicationPageState createState() => _MedicationPageState();
}

String freqValue = "OD";
String typeOfMedicine = "Tablet";
String rootOfAdministration = "Oral";

String days;

class _MedicationPageState extends State<MedicationPage> {
  final MedicationController medicationC = Get.put(MedicationController());
  final SearchController searchC = Get.put(SearchController());

  @override
  void initState() {
    // freqValue = frequency.first;
    super.initState();
    searchC.initializeDetails(medicationC.medicationsList);
    // _patientDetails = patientsC.patientsList;
  }

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
                  onChanged: searchC.onSearchTextChanged,
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
                      else if (searchC.searchText.isNotEmpty)
                        return generateLists(media, searchC.searchResult);
                      else
                        return generateLists(
                            media, medicationC.medicationsList);
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

  ListView generateLists(Size media, List data) {
    return ListView.separated(
      separatorBuilder: (context, index) => 10.heightBox,
      itemCount: data.length,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data[index]
                        .name
                        .toString()
                        .text
                        .white
                        .size(media.height * 0.024 - 5)
                        .make(),
                    data[index]
                        .composition
                        .toString()
                        .text
                        // .size(10)
                        .size(media.height * 0.02 - 5)
                        .white
                        .make(),
                    data[index]
                        .rantinine
                        .toString()
                        .text
                        // .size(10)
                        .size(media.height * 0.02 - 5)
                        .color(Color(0xff9F9FA5))
                        .make(),
                  ],
                ),
                Spacer(),
                Checkbox(
                  shape: CircleBorder(),
                  fillColor: MaterialStateProperty.all(Color(0xff0A84FF)),
                  value: medicationC.isSelected[index],
                  onChanged: (value) {
                    if (value)
                      Get.bottomSheet(
                        SingleChildScrollView(
                          child: StatefulBuilder(
                            builder: (BuildContext context,
                                StateSetter dropDownSetState) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                height: media.height * 0.5,
                                color: Coolors.bgColorP,
                                child: Column(
                                  children: [
                                    generateDropDownRow(media, "Frequency",
                                        ['OD', 'BD', 'TDS', 'QID'], (v) {
                                      dropDownSetState(() {
                                        freqValue = v;
                                      });
                                    }),
                                    generateDropDownRow(
                                        media, "Type Of\nMedicine", [
                                      "Tablet",
                                      "Capsule",
                                      "Syrup",
                                      "Injection - IV",
                                      "Injection - IM",
                                      "Injection - SC"
                                    ], (v) {
                                      dropDownSetState(() {
                                        typeOfMedicine = v;
                                      });
                                    }),
                                    generateDropDownRow(media, "Root",
                                        ["Oral", "Injectable", "Topical"], (v) {
                                      dropDownSetState(() {
                                        rootOfAdministration = v;
                                      });
                                    }),
                                    Wgt.getTFF(
                                        text: 'Duration',
                                        onChange: (value) => days = value),
                                    10.heightBox,
                                    Wgt.getPrimaryBtn(
                                        text: "Add",
                                        context: context,
                                        cb: () {
                                          print(freqValue);
                                          print(typeOfMedicine);
                                          print(rootOfAdministration);
                                          print(days);
                                          // TODO post call here API ??
                                          Navigator.pop(context);
                                          setState(() {
                                            medicationC.isSelected[index] =
                                                false;
                                          });
                                        })
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    // Wgt.addMedicationDialog(context, (json) async {
                    //   var data = await medicationC.onMedication(json);
                    //   print(data); // message
                    // });
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
  }

  Row generateDropDownRow(
      Size media, String label, List<String> data, Function cb) {
    return Row(
      children: [
        label.text.white
            // .bold
            .size(media.height * 0.025)
            .make(),
        Spacer(),
        Container(
          width: media.width * 0.5,
          height: media.height * 0.06,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Coolors.primaryBtn, width: 2)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                hint: label.text.make(),
                isExpanded: true,
                iconSize: 36,
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                value: getVariable(label),
                items: data.map(buildMenuItem).toList(),
                onChanged: (v) {
                  cb(v);
                }),
          ),
        )
      ],
    );
  }

  getVariable(label) {
    if (label == "Frequency") return freqValue;
    if (label == "Type Of\nMedicine") return typeOfMedicine;
    if (label == "Root") return rootOfAdministration;
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(value: item, child: item.text.black.bold.make());
  }
}
