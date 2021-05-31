import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tooth/signup/last_page.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2A2E43),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  children: [
                    "You Are \n1/2 Away"
                        .text
                        .xl5
                        .color(Colors.white)
                        .make()
                        .centered(),
                    25.heightBox,
                    Wgt.getTFF(text: "Email"),
                    17.heightBox,
                    Wgt.getTFF(text: "WhatsApp"),
                    17.heightBox,
                    Wgt.getTFF(text: "DR"),
                    // 10.heightBox,
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Wgt.getSecondaryBtn(
                        text: "NEXT",
                        context: context,
                        cb: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LastPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
