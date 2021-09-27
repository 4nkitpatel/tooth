import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/controllers/Patients.dart';
import 'package:tooth/screens/dashboard/bottom_chooser.dart';
import 'package:tooth/screens/dashboard/medication.dart';
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

  @override
  void initState() {
    super.initState();
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
              ? CloseButton()
              : InkWell(
                  onTap: () {
                    // Navigator.pop(context);
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
                final urlSelectedImages = controller.value.selectedIndexes
                    .map<String>(
                        (index) => patientsC.patientsList[index].imageUrl)
                    .toList();
                // HERE WE willl get selectd image
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
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff1F2125),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: ImageIcon(
                  AssetImage('assets/nav-boy.png'),
                  size: 40,
                  color: Color(0xffA6A6A6),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Get.toNamed("/schedule");
                },
                child: ImageIcon(
                  AssetImage('assets/nav-calendar.png'),
                  size: 40,
                  color: Color(0xffA6A6A6),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Get.toNamed("/patients");
                },
                child: ImageIcon(
                  AssetImage('assets/nav-laddy.png'),
                  size: 40,
                  color: Color(0xffA6A6A6),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Color(0xffA6A6A6),
                ),
              )
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
              ),
              20.heightBox,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                        height: 300,
                        child: ChooseTime(),
                      ));
                    },
                    child: "Wed, May 31"
                        .text
                        .size(media.height * 0.023 - 5)
                        .color(Color(0xff0A84FF))
                        .make(),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(MedicationPage());
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
                      else
                        return DragSelectGridView(
                          triggerSelectionOnTap: true,
                          gridController: controller,
                          padding: EdgeInsets.all(8),
                          itemCount: patientsC.patientsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index, isSelected) =>
                              SelectableItemWidget(
                            patient: patientsC.patientsList[index],
                            isSelected: isSelected,
                          ),
                        );
                    },
                  ),
                ),
              ),
              Wgt.getSecondaryBtn(
                text: 'Send Greetings',
                context: context,
                cb: () {
                  // Navigator.pushNamed(context, '/schedule');
                  Get.toNamed("/schedule");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
