import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class AddClinicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Add Clinic".text.size(15).color(Colors.white).center.make(),
        backgroundColor: Color(0xff1F1F1F),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color(0xff222830),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  "Clinic 1"
                      .text
                      .xl5
                      .center
                      .color(Colors.white)
                      .make()
                      .centered(),
                  25.heightBox,
                  Wgt.getTFF(text: "Pincode"),
                  17.heightBox,
                  Wgt.getTFF(text: "City"),
                  17.heightBox,
                  Wgt.getTFF(text: "State"),
                  17.heightBox,
                  Wgt.getTFF(text: "Address"),
                  17.heightBox,
                  // Spacer(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Wgt.getSecondaryBtn(
                      text: "Done",
                      context: context,
                      cb: () {
                        Navigator.pop(context);
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
