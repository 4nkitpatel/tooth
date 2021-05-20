import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class ExpenditurePage extends StatefulWidget {
  @override
  _ExpenditurePageState createState() => _ExpenditurePageState();
}

class _ExpenditurePageState extends State<ExpenditurePage> {
  // final List cards = new List.generate(10, (i) => CustomCard()).toList();

  Future<List<dynamic>> getData() async {
    var res =
        await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));
    return jsonDecode(res.body);
  }

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wgt.getBtn("Stock", Icons.dashboard, () {
                    print("First Button Clicked");
                    getData();
                    setState(() {
                      flag = true;
                    });
                  }),
                  Wgt.getBtn("Lab Pay", Icons.payment, () {
                    print("Second Button Clicked");
                    setState(() {
                      flag = true;
                    });
                  }),
                  Wgt.getBtn("Mics Pay", Icons.payment, () {
                    print("Third Button Clicked");
                    setState(() {
                      flag = true;
                    });
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wgt.getBtn("Add Data", Icons.add, () {
                    print("Add expenditures clicked");
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.9,
                            child: Container(
                              color: Color(0xFF737373),
                              child: Container(
                                child: buildInputModel(context),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                              ),
                            ),
                          );
                        });
                  })
                ],
              ),
              if (flag)
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child:
                            "Error Ocurred".text.bold.color(Colors.red).make(),
                      );
                    } else if (snapshot.hasData) {
                      return SizedBox(
                        height:
                            MediaQuery.of(context).size.height, // fixed height
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                color: Colors.amber[50],
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data[index]['body'])
                                  ],
                                ).p8(),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                  future: getData(),
                ),
              // if (flag)
              //   SizedBox(
              //     height: MediaQuery.of(context).size.height, // fixed height
              //     child: ListView(
              //       children: cards,
              //       shrinkWrap: true,
              //     ),
              //   ),
            ],
          ).p16(),
        ),
      ),
    );
  }

  SingleChildScrollView buildInputModel(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wgt.getTF("Sl No"),
          Wgt.getTF("Name Of Item"),
          Wgt.getTF("Quantity"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              "Purchase Date".text.xl.make(),
              DateWgt(),
            ],
          ),
          Wgt.getTF("Bill Number"),
          Wgt.getTF("Bill Amount"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              "Consumption Date".text.xl.make(),
              DateWgt(),
            ],
          ),
          Wgt.getTF("Stcok"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              "Paymnet Date".text.xl.make(),
              DateWgt(),
            ],
          ).py8(),
          Wgt.getBtn("Submit", Icons.done, () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}

// class CustomCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         color: Colors.amber[50],
//         height: 100,
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             "Heading".text.bold.xl.make(),
//             "Some more information here or captio here".text.make(),
//             "Some more information here or captio here some more information"
//                 .text
//                 .make()
//           ],
//         ).p8(),
//       ),
//     );
//   }
// }
