import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/services/api.service.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AddClinicPage extends StatelessWidget {
  final args = Get.arguments;
  final formKey = GlobalKey<FormState>();
  String pincode;
  String city;
  String state;
  String address;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Add Clinic"
            .text
            .size(media.height * 0.023 - 5)
            .color(Colors.white)
            .center
            .make(),
        backgroundColor: Color(0xff1F1F1F),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xff222830),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    "Clinic 1"
                        .text
                        .size(media.height * 0.05)
                        .center
                        .color(Colors.white)
                        .make()
                        .centered(),
                    25.heightBox,
                    Wgt.getTFF(
                      text: "Pincode",
                      type: "pincode",
                      onChange: (value) => pincode = value,
                    ),
                    17.heightBox,
                    Wgt.getTFF(
                      text: "City",
                      type: "lencheck",
                      onChange: (value) => city = value,
                    ),
                    17.heightBox,
                    Wgt.getTFF(
                      text: "State",
                      type: "lencheck",
                      onChange: (value) => state = value,
                    ),
                    17.heightBox,
                    Wgt.getTFF(
                      text: "Address",
                      type: "address",
                      onChange: (value) => address = value,
                    ),
                    17.heightBox,
                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Wgt.getSecondaryBtn(
                        text: "Done",
                        context: context,
                        cb: () async {
                          // Navigator.pop(context);
                          final isValid = formKey.currentState.validate();
                          if (isValid) {
                            formKey.currentState.save();
                            if (args != null &&
                                !args.isEmpty &&
                                args.runtimeType.toString() != 'String') {
                              print("Final ==== > $args");
                              args["pincode"] = pincode;
                              args["city"] = city;
                              args["state"] = state;
                              args["address"] = address;
                              print("Final ==== > $args");
                              // API call on success
                              var message = await ApiServices.onSignUp(args);
                              print(message);
                              // redirect to
                              if (message["status"] == 201) {
                                Get.offAllNamed("/dashboard",
                                    arguments: args["drName"]);
                              } else {
                                Get.snackbar(
                                  "Error",
                                  message["message"],
                                  backgroundColor: Colors.redAccent,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            } else {
                              var arg = {};
                              arg["pincode"] = pincode;
                              arg["city"] = city;
                              arg["state"] = state;
                              arg["address"] = address;
                              print("Final ==== > $arg");
                              // API call on success
                              var message = await ApiServices.onAddClinic(arg);
                              print(message);
                              // redirect to
                              if (message["status"] == 201) {
                                Get.toNamed("/dashboard", arguments: args);
                              } else {
                                Get.snackbar(
                                  "Error",
                                  message["message"],
                                  backgroundColor: Colors.redAccent,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            }
                          }
                        },
                      ),
                    ),
                    // 5.heightBox,
                    "OR".text.white.make(),
                    5.heightBox,
                    GestureDetector(
                      onTap: () async {
                        if (args != null &&
                            !args.isEmpty &&
                            args.runtimeType.toString() != 'String') {
                          var message = await ApiServices.onSignUp(args);
                          print(message);
                          // redirect to
                          if (message["status"] == 201) {
                            Get.offAllNamed("/dashboard",
                                arguments: args["drName"]);
                          } else {
                            Get.snackbar(
                              "Error",
                              message["message"],
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        } else {
                          Get.toNamed("/dashboard", arguments: args);
                        }
                      },
                      child: "Add clinic later".text.blue400.underline.make(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
