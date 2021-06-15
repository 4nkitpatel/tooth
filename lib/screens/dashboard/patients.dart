import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:tooth/widgets/selectable_item_widget.dart';
import 'package:tooth/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final controller = DragSelectGridViewController();
  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=933&q=80',
    'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80',
    'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1528684394826-ea798614d051?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1502452213786-a5bc0a67e963?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1514626585111-9aa86183ac98?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1514846326710-096e4a8035e0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(rebuild);
  }

  @override
  void dispose() {
    controller.removeListener(rebuild);
    super.dispose();
  }

  void rebuild() => setState(() {});
  @override
  Widget build(BuildContext context) {
    final isSelected = controller.value.isSelecting;
    final text = isSelected
        ? '${controller.value.amount} Images Selected'
            .text
            .size(15)
            .white
            .make()
        : "Patients".text.size(15).white.make();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff161819),
        appBar: AppBar(
          centerTitle: true,
          title: text,
          // "Mr. Andy".text.size(17).make(),
          backgroundColor: Color(0xff1F2125),
          leadingWidth: 100,
          leading: isSelected
              ? CloseButton()
              : InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: "Select All"
                      .text
                      .color(Color(0xff007AFF))
                      .make()
                      .pOnly(top: 18, left: 18),
                ),
          actions: <Widget>[
            // if (isSelected)
            InkWell(
              onTap: () {
                final urlSelectedImages = controller.value.selectedIndexes
                    .map<String>((index) => urlImages[index])
                    .toList();
                // HERE WE willl get selectd image
              },
              child: "Done"
                  .text
                  .center
                  .color(Color(0xff007AFF))
                  .make()
                  .pOnly(top: 18, right: 16),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff1F2125),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Color(0xffA6A6A6),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today_sharp,
                  color: Color(0xffA6A6A6),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Color(0xffA6A6A6),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Color(0xffA6A6A6),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                style: TextStyle(color: Color(0xff00ADB5)),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Color(0xff00ADB5)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  focusColor: Color(0xff393E46),
                  hoverColor: Color(0xff393E46),
                  contentPadding: EdgeInsets.only(left: 20),
                  fillColor: Color(0xff393E46),
                ),
              ),
              20.heightBox,
              Row(
                children: [
                  "Wed, May 31".text.color(Color(0xff0A84FF)).make(),
                  Spacer(),
                  "All Clinics".text.color(Color(0xff0A84FF)).make(),
                ],
              ),
              10.heightBox,
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: DragSelectGridView(
                  triggerSelectionOnTap: true,
                  gridController: controller,
                  padding: EdgeInsets.all(8),
                  itemCount: urlImages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index, isSelected) =>
                      SelectableItemWidget(
                    url: urlImages[index],
                    isSelected: isSelected,
                  ),
                ),
              ),
              Wgt.getSecondaryBtn(
                text: 'Send Greetings',
                context: context,
                cb: () {
                  Navigator.pushNamed(context, '/schedule');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
