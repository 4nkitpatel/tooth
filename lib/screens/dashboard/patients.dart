import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/controllers/Patients.dart';
import 'package:tooth/controllers/search.controller.dart';
import 'package:tooth/models/Patients.dart';
import 'package:tooth/screens/dashboard/address_list.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
import 'package:tooth/screens/dashboard/medication.dart';
import 'package:tooth/widgets/refresh_indicator.dart';
import 'package:tooth/widgets/selectable_item_widget.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final controller = DragSelectGridViewController();
  final PatientsController patientsC = Get.put(PatientsController());
  final SearchController searchC = Get.put(SearchController());

  List<Patients> filteredData = [];
  String timeFilter = "Default";
  // List _searchResult = [];
  // List _patientDetails;

  @override
  void initState() {
    super.initState();
    searchC.initializeDetails(patientsC.patientsList);
    // _patientDetails = patientsC.patientsList;
    controller.addListener(rebuild);
  }

  @override
  void dispose() {
    controller.removeListener(rebuild);
    super.dispose();
  }

  void rebuild() => setState(() {});
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final isSelected = controller.value.isSelecting;

    final text = isSelected
        ? '${controller.value.amount} Images Selected'
            .text
            .size(media.height * 0.021)
            .white
            .make()
        : "Patients".text.size(media.height * 0.021).white.make();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: text,
          // "Mr. Andy".text.size(17).make(),
          backgroundColor: Color(0xff1F2125),
          leadingWidth: 100,
          leading: isSelected
              ? CloseButton(
                  onPressed: () {
                    controller.value = Selection({});
                  },
                )
              : InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                    Set<int> all = Set();
                    for (var i = 0; i < patientsC.patientsList.length; i++) {
                      all.add(i);
                    }
                    controller.value = Selection(all);
                  },
                  child: "Select All"
                      .text
                      .color(Color(0xff007AFF))
                      .make()
                      .pOnly(top: 18, left: 18),
                ),
          actions: <Widget>[
            // if (isSelected)
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
        bottomNavigationBar:
            // SizedBox(
            //   height: 45,
            //   child: BottomNavigationBar(
            //     backgroundColor: Color(0xff1F2125),
            //     iconSize: 18,
            //     type: BottomNavigationBarType.fixed,
            //     unselectedFontSize: 10,
            //     selectedFontSize: 10,
            //     currentIndex: 2,
            //     items: [
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             Get.toNamed("/dashboard");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/nav-boy.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "Dashboard",
            //         // backgroundColor: Color(0xff1F2125),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             Get.toNamed("/schedule");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/nav-calendar.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "Appointment",
            //         // backgroundColor: Color(0xff1F2125),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             Get.toNamed("/patients");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/nav-laddy.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "Patients",
            //         // backgroundColor: Color(0xff1F2125),
            //       ),
            //       BottomNavigationBarItem(
            //         icon: InkWell(
            //           borderRadius: BorderRadius.circular(50),
            //           onTap: () {
            //             // Get.toNamed("/patients");
            //           },
            //           child: ImageIcon(
            //             AssetImage('assets/more_icon.png'),
            //             // size: 40,
            //             color: Color(0xffA6A6A6),
            //           ),
            //         ).pOnly(bottom: 5),
            //         label: "More",
            //       ),
            //     ],
            //   ),
            // ),
            BottomAppBar(
          color: Color(0xff1F2125),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Get.toNamed("/dashboard");
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/nav-boy.png'),
                        size: 25,
                        color: Color(0xffA6A6A6),
                      ),
                      3.heightBox,
                      Text(
                        "Dashboard",
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      )
                    ],
                  ),
                ).pOnly(left: 10),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Get.toNamed("/schedule");
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/nav-calendar.png'),
                        size: 25,
                        color: Color(0xffA6A6A6),
                      ),
                      3.heightBox,
                      Text(
                        "Appointment",
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Get.toNamed("/patients");
                },
                child: Container(
                  height: 45,
                  child: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/nav-laddy.png'),
                        size: 25,
                        color: Color(0xffA6A6A6),
                      ),
                      3.heightBox,
                      Text(
                        "Patients",
                        style: TextStyle(color: Colors.blue, fontSize: 9),
                      )
                      // "Patients".text.size(5).white.make()
                    ],
                  ),
                ).pOnly(top: 5),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  // Get.toNamed("/patients");
                },
                child: Container(
                  height: 40,
                  child: Column(
                    children: [
                      ImageIcon(
                        AssetImage('assets/more_icon.png'),
                        size: 25,
                        color: Color(0xffA6A6A6),
                      ),
                      3.heightBox,
                      Text(
                        "More",
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      )
                      // "Patients".text.size(5).white.make()
                    ],
                  ),
                ),
              ).pOnly(right: 10),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                        // height: 300,
                        child: ChooseTime(
                          cb: (value) {
                            print("============== > ${describeEnum(value)}");
                            setState(() {
                              timeFilter = describeEnum(value);
                              patientsC.fetchPatients(time: timeFilter);
                            });
                          },
                        ),
                      ));
                    },
                    child: timeFilter
                        .toString()
                        .text
                        .size(media.height * 0.023 - 5)
                        .color(Color(0xff0A84FF))
                        .make(),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(AddressListPage(
                        cb: (data, isSelected) {
                          isSelected
                              ? filteredData +=
                                  patientsC.patientsList.filter((element) {
                                  return element.addressName ==
                                      data.addressName;
                                }).toList()
                              : filteredData = filteredData.filter((element) {
                                  return element.addressName !=
                                      data.addressName;
                                }).toList();
                          setState(() {});
                        },
                      ));
                    },
                    child: "All Clinics"
                        .text
                        .size(media.height * 0.023 - 5)
                        .color(Color(0xff0A84FF))
                        .make(),
                  )
                ],
              ),
              10.heightBox,
              Expanded(
                child: Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Obx(
                    () {
                      if (patientsC.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else if (patientsC.patientsList.length == 0)
                        return "No data available"
                            .text
                            .color(Color(0xff646262))
                            .make();
                      else if (searchC.searchText.isNotEmpty)
                        return RefreshWidget(
                          child: createDragSelectGridView(searchC.searchResult),
                          onRefresh: patientsC.fetchPatients,
                        );
                      else
                        return RefreshWidget(
                          child: createDragSelectGridView(
                            filteredData.length > 0
                                ? filteredData
                                : patientsC.patientsList,
                          ),
                          onRefresh: patientsC.fetchPatients,
                        );
                    },
                  ),
                ),
              ),
              Wgt.getSecondaryBtn(
                text: 'Send Greetings',
                context: context,
                cb: () async {
                  final selectedData = controller.value.selectedIndexes
                      .map((index) => patientsC.patientsList[index])
                      .toList();
                  print(selectedData);
                  if (selectedData.length > 0) {
                    var data = await patientsC.sendGreetings(selectedData);
                    print("data ==> $data");
                    Get.snackbar(
                      "Message",
                      data["message"],
                      backgroundColor: Color(0xff0A84FF),
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                      animationDuration: Duration(milliseconds: 500),
                      colorText: Colors.white,
                    );
                    controller.value = Selection({});
                  } else {
                    Get.snackbar(
                      "Message",
                      "Select atleast one patient",
                      backgroundColor: Color(0xff0A84FF),
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                      animationDuration: Duration(milliseconds: 500),
                      colorText: Colors.white,
                    );
                  }
                  // Navigator.pushNamed(context, '/schedule');
                  // Get.toNamed("/schedule");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  DragSelectGridView createDragSelectGridView(List data) {
    return DragSelectGridView(
      triggerSelectionOnTap: true,
      gridController: controller,
      padding: EdgeInsets.all(8),
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index, isSelected) => SelectableItemWidget(
        patient: data[index],
        isSelected: isSelected,
      ),
    );
  }

  // onSearchTextChanged(String text) async {
  //   _searchResult.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }
  //   _patientDetails.forEach((patient) {
  //     if (patient.name.toLowerCase().contains(text.toLowerCase()))
  //       _searchResult.add(patient);
  //   });
  //   setState(() {});
  // }
}
