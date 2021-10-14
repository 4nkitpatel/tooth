import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/screens/dashboard/add_clinic.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  final args = Get.arguments;
  final formKey = GlobalKey<FormState>();
  String mobNo;
  String dob;
  String registation;
  String selectedDate;
  bool isDateEntered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "New User".text.size(17).color(Colors.white).center.make(),
        backgroundColor: Color(0xff1F1F1F),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,
                  "Congratulation"
                      .text
                      .xl5
                      .color(Colors.white)
                      .make()
                      .centered(),
                  50.heightBox,
                  Wgt.getTFF(
                    text: "Mob",
                    type: "phoneno",
                    onChange: (value) => mobNo = value,
                  ),
                  17.heightBox,
                  DateWgt(
                    cb: (date) {
                      print("===============> $date");
                      selectedDate = date;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          isDateEntered = true;
                        });
                      });
                    },
                  ),
                  !isDateEntered
                      ? "Date is requied :)"
                          .text
                          .color(Colors.redAccent[400])
                          .size(MediaQuery.of(context).size.height * 0.015)
                          .make()
                          .pOnly(left: 25, right: 16, top: 5)
                      : Container(),
                  17.heightBox,
                  Wgt.getTFF(
                    text: "Registration",
                    type: "aplhanumeric",
                    onChange: (value) => registation = value,
                  ),
                  17.heightBox,
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Wgt.getSecondaryBtn(
                      text: "Done",
                      context: context,
                      cb: () {
                        // Navigator.pushNamed(context, '/dashboard');
                        args["registation"] = registation;
                        args["date"] = selectedDate;
                        args["mobNo"] = mobNo;
                        print(args);
                        print("registation $registation");
                        print("date $selectedDate");
                        print("mobNo $mobNo");
                        final isValid = formKey.currentState.validate();
                        if (isValid && isDateEntered) {
                          formKey.currentState.save();
                          Get.toNamed("/addclinic", arguments: args);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
