import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class ColorPickerRow extends StatefulWidget {
  Color selectedColor;
  final String label;
  Function(Color, String) changeColor;

  ColorPickerRow(
      {Key? key,
      this.selectedColor = Colors.black,
      required this.label,
      required this.changeColor})
      : super(key: key);

  @override
  State<ColorPickerRow> createState() => _ColorPickerRowState();
}

class _ColorPickerRowState extends State<ColorPickerRow> {
  @override
  Widget build(BuildContext context) {
    final _controller = CircleColorPickerController(
      initialColor: widget.selectedColor,
    );

    return InkWell(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 0.0,
                      blurRadius: 4,
                      offset: Offset(3.0, 3.0)),
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 0.0,
                      blurRadius: 4 / 2.0,
                      offset: Offset(3.0, 3.0)),
                ], color: widget.selectedColor, shape: BoxShape.circle),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
      onTap: () {
        showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(widget.label),
              content: StatefulBuilder(
                builder: (customContext, stateSetter) {
                  return SingleChildScrollView(
                    child: CircleColorPicker(
                      controller: _controller,
                      onChanged: (color) {
                        stateSetter(() => widget.selectedColor = color);
                        setState(() => widget.selectedColor = color);
                        widget.changeColor(widget.selectedColor, widget.label);
                      },
                    ),
                  );
                },
              ),
              actions: <Widget>[
                Center(
                  child: TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
// return AlertDialog(
// title: Text(widget.label),
// content: SingleChildScrollView(
// child: CircleColorPicker(
// controller: _controller,
// onChanged: (color) {
// setState(() => widget.selectedColor = color);
// },
// ),
// ),
// actions: <Widget>[
// TextButton(
// child: const Text('Ok'),
// onPressed: () {
// Navigator.of(context).pop();
// },
// ),
// ],
// );
