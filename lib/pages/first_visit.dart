import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tooth/widgets/widgets.dart';

class FirstVisit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Prescription"
                    .text
                    .xl5
                    .bold
                    .color(context.theme.accentColor)
                    .make()
                    .centered(),
                Wgt.getTF("Pt Name"),
                Wgt.getTF("Age"),
                Wgt.getToggleBtn(),
                DateWgt(),
                Wgt.getTF("Attenders Doctor"),
                Wgt.getTF("Chief Complain"),
                Wgt.getTF("O/E"),
                Wgt.getTF("Treatment Advice"),
                Wgt.getTF("Treatment Done"),
                Wgt.getTF("Medicine Prescription"),
                Wgt.getBtn("Expenditure", Icons.money, () {
                  Navigator.pushNamed(context, '/expenditure');
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
