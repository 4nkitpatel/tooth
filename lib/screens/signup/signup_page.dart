import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/screens/signup/last_page.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatelessWidget {
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
                    Wgt.getTFF(text: "Email"),
                    17.heightBox,
                    Wgt.getTFF(text: "WhatsApp"),
                    17.heightBox,
                    Wgt.getTFF(text: "DR"),
                    17.heightBox,
                    Wgt.getTFF(text: "Qualification"),
                    17.heightBox,
                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Wgt.getSecondaryBtn(
                        text: "NEXT",
                        context: context,
                        cb: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LastPage(),
                            ),
                          );
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
