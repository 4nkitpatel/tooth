import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:tooth/colors.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Card(
        color: Color(0xff161819),
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 2,
                child: PieChart(
                  PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        final desiredTouch =
                            pieTouchResponse.touchInput is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
                        if (desiredTouch &&
                            pieTouchResponse.touchedSection != null) {
                          touchedIndex = pieTouchResponse
                              .touchedSection.touchedSectionIndex;
                        } else {
                          touchedIndex = -1;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: double.infinity,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   width: 28,
            // ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 19.0 : 13.0;
      final radius = isTouched ? 40.0 : 30.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff1F78B4),
            value: 60,
            // showTitle: true,
            title: '60%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Coolors.bgColorP),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffA6CEE3),
            value: 20,
            // showTitle: false,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Coolors.bgColorP),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffB2DF8A),
            value: 20,
            // showTitle: false,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Coolors.bgColorP),
          );
        // case 3:
        //   return PieChartSectionData(
        //     color: const Color(0xff13d38e),
        //     value: 15,
        //     title: '15%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //         fontSize: fontSize,
        //         fontWeight: FontWeight.bold,
        //         color: const Color(0xffffffff)),
        //   );
        default:
          throw Error();
      }
    });
  }
}
