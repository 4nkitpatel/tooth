import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/screens/signup/last_page.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String email;
  String whatsAppNo;
  String drName;
  String qualification;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: "New User".text.size(15).color(Colors.white).center.make(),
          backgroundColor: Color(0xff1F1F1F),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Color(0xff222831),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.75),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      "You Are \n1/2 Away"
                          .text
                          .size(media.height * 0.06 - 5)
                          .center
                          .color(Colors.white)
                          .make()
                          .centered(),
                      25.heightBox,
                      Wgt.getTFF(
                        text: "Email",
                        type: "email",
                        onChange: (value) => email = value,
                      ),
                      17.heightBox,
                      Wgt.getTFF(
                        text: "WhatsApp No",
                        type: "phoneno",
                        onChange: (value) => whatsAppNo = value,
                      ),
                      17.heightBox,
                      Wgt.getTFF(
                        text: "Full Name",
                        type: "lencheck",
                        onChange: (value) => drName = value,
                      ),
                      17.heightBox,
                      Wgt.getTFF(
                        text: "Qualification",
                        type: "lencheck",
                        onChange: (value) => qualification = value,
                      ),
                      17.heightBox,
                      // Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Wgt.getSecondaryBtn(
                          text: "NEXT",
                          context: context,
                          cb: () {
                            final isValid = formKey.currentState.validate();
                            if (isValid) {
                              formKey.currentState.save();
                              print("Email ====> $email");
                              print("Phone ====> $whatsAppNo");
                              print("Dr Name ====> $drName");
                              print("Qualification ====> $qualification");
                              Get.toNamed("/afterSignup", arguments: {
                                "email": email,
                                "whatsAppNo": whatsAppNo,
                                "drName": drName,
                                "qualification": qualification
                              });
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
        ));
  }
}
