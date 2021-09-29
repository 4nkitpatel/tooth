import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/controllers/Symptoms.dart';
import 'package:tooth/models/symptoms.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/instance_manager.dart';

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  final SymptomsController symptomsController = Get.put(SymptomsController());

  // ? may be this both will go to contoller
  double sliderValue = 0;
  List<bool> isTeethSelected = List.generate(8, (i) => false).toList();
  List<Symptoms> _searchResult = [];
  List<Symptoms> _symptomsDetails;
  // TODO may be see that seleected redio button is perfect or not or may be this varible will go to controller
  // TODO also to lower case issue may be
  @override
  void initState() {
    super.initState();
    _symptomsDetails =
        symptomsController.symptomsList; // await ApiServices.fetchSymptoms();
    print("-----> $_symptomsDetails");
  }

  // int _value = 0;
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
                  //onSearchTextChanged
                  onChanged: onSearchTextChanged,
                ),
                20.heightBox,
                "Upper Left Maxila"
                    .text
                    .size(media.height * 0.025)
                    .white
                    .make(),
                10.heightBox,
                "Advice List"
                    .text
                    .size(media.height * 0.019)
                    .color(Color(0xffCECECE))
                    .make(),
                10.heightBox,
                Container(
                  height: media.height * 0.37, // 350,
                  // color: Colors.red,
                  child: Obx(
                    () {
                      if (symptomsController.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return _searchResult.length != 0
                            ? listViewData(_searchResult)
                            : listViewData(
                                symptomsController.symptomsList,
                              );
                    },
                  ),
                ),
                10.heightBox,
                "Teeth Number"
                    .text
                    .size(media.height * 0.019)
                    .color(Color(0xffCECECE))
                    .make(),
                5.heightBox,
                Container(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: media.height * 0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        (media.width * 0.02).widthBox,
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
                              topLeft: Radius.circular(media.height * 0.03),
                              topRight: Radius.circular(media.height * 0.03),
                            ),
                          ),
                          // alignment: Alignment.center,
                          // color: Colors.green,
                          width: media.width * 0.1, // 33,
                          height: media.height * 0.05,
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
                                        : Colors.black,
                                    fontSize: media.height * 0.02),
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
                "Severity"
                    .text
                    .size(media.height * 0.019)
                    .color(Color(0xffCECECE))
                    .make(),
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
                    // Navigator.pushNamed(context, "/expenditureDetails");
                    // Get.toNamed("/expenditureDetails");
                    Wgt.showDialogWithSingleInput(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView listViewData(List data) {
    return ListView.separated(
      separatorBuilder: (context, index) => 10.heightBox,
      itemCount: data.length, //symptomsController.symptomsList.length,
      itemBuilder: (context, index) {
        final media = MediaQuery.of(context).size;
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            color: Color(0xff2C2C2E),
            width: MediaQuery.of(context).size.width,
            height: media.height * 0.13,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: media.height * 0.02)),
                      // data[index].name.text.white.make(),
                      AutoSizeText(
                        data[index].description,
                        style: TextStyle(
                          fontSize: media.height * 0.015,
                          color: Color(0xff616165),
                        ),
                        maxLines: 4,
                        // minFontSize: 8,
                        // maxFontSize: 10,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Checkbox(
                  shape: CircleBorder(),
                  fillColor: MaterialStateProperty.all(Color(0xff0A84FF)),
                  value: symptomsController.isSelected[index],
                  onChanged: (value) {
                    setState(() {
                      symptomsController.isSelected[index] = value;
                    });
                  },
                ),
              ],
            ).p8(),
          ),
        );
      },
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _symptomsDetails.forEach((symptomsDetail) {
      if (symptomsDetail.name.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(symptomsDetail);
    });
    setState(() {});
  }
}
