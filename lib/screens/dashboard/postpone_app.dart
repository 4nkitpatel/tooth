import 'package:flutter/material.dart';
import 'package:tooth/colors.dart';
import 'package:tooth/models/Schedule.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class PostponeApp extends StatefulWidget {
  final Schedule schedule;
  PostponeApp({Key key, this.schedule}) : super(key: key);
  @override
  _PostponeAppState createState() => _PostponeAppState();
}

class _PostponeAppState extends State<PostponeApp> {
  String postponedDate = '';
  List<bool> selected = [];

  @override
  void initState() {
    super.initState();
    selected = List.filled(widget.schedule.drDetails.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(16.0),
        height: media.height * 0.5,
        color: Color(0xff1F2125),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Postpone App: ".text.size(media.height * 0.023).white.make(),
            15.heightBox,
            DateWgt(
              cb: (date) {
                print("===============> $date");
                postponedDate = date;
                // selectedDate = date;
                // WidgetsBinding.instance.addPostFrameCallback((_) {
                //   setState(() {
                //     isDateEntered = true;
                //   });
                // });
              },
            ),
            15.heightBox,
            "Appoitnt to: ".text.size(media.height * 0.023).white.make(),
            15.heightBox,
            Container(
              width: MediaQuery.of(context).size.width,
              height: media.height * 0.2,
              // color: Colors.blueAccent,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int i) {
                  return SizedBox(width: media.height * 0.015);
                },
                itemCount: widget.schedule.drDetails.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onLongPress: () {
                      print("pressed");
                      print(widget.schedule.drDetails[i].drName);
                      setState(() {
                        selected[i] = true;
                      });
                    },
                    onTap: () {
                      if (selected[i]) {
                        setState(() {
                          selected[i] = false;
                        });
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                          color: selected[i]
                              ? Coolors.secondaryBtn
                              : Coolors.bgColorS,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: media.height * 0.13,
                                child: Image.network(
                                  widget.schedule.drDetails[i].imageUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              10.heightBox,
                              widget.schedule.drDetails[i].drName
                                  .toString()
                                  .text
                                  .white
                                  // .size(media.height * 0.01)
                                  .make(),
                            ],
                          ),
                          // color: Color(0xff060606),
                          height: media.height * 0.2, //150,
                          width: media.width * 0.3 // 160,
                          ),
                    ),
                  );
                },
              ),
            ),
            6.heightBox,
            Wgt.getSecondaryBtn(
                text: "Done",
                context: context,
                cb: () {
                  print(postponedDate);
                  selected.asMap().forEach((index, value) {
                    if (value) {
                      print(widget.schedule.drDetails[index].drName);
                      // TODO some call will come here may be POST call where ?
                    }
                  });
                })
          ],
        ));
  }
}
