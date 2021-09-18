import 'package:flutter/material.dart';
import 'package:tooth/models/Patients.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectableItemWidget extends StatefulWidget {
  final Patients patient;
  final bool isSelected;

  const SelectableItemWidget({
    Key key,
    this.patient,
    this.isSelected,
  }) : super(key: key);

  @override
  _SelectableItemWidgetState createState() => _SelectableItemWidgetState();
}

class _SelectableItemWidgetState extends State<SelectableItemWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        width: double.infinity,
        color: Color(0xff1F2125),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(widget.patient.imageUrl, fit: BoxFit.cover),
            ),
            widget.patient.name.text
                .color(Color(0xff00ADB5))
                .size(media.height * 0.018 - 3)
                .make(),
            widget.patient.date.text
                .color(Color(0xff00ADB5))
                .size(media.height * 0.018 - 3)
                .make(),
          ],
        ),
      ),
      Positioned(
        right: 5,
        top: 5,
        child: widget.isSelected
            ? Icon(
                Icons.verified,
                color: Color(0xff0A84FF),
                size: media.height * 0.03 - 3,
              )
            : Container(),
      ),
    ]);
  }
//   @override
//   Widget build(BuildContext context) => AnimatedBuilder(
//         animation: scaleAnimation,
//         builder: (context, child) => Transform.scale(
//           scale: scaleAnimation.value,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(widget.isSelected ? 80 : 20),
//             child: child,
//           ),
//         ),
//         child: Image.network(widget.url, fit: BoxFit.cover),
//       );
}
