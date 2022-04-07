import 'package:flutter/material.dart';
import 'package:vcard_to_qr/components/form/color_picker_row.dart';
import 'package:vcard_to_qr/helper/alert_helper.dart';
import 'package:vcard_to_qr/screens/qr.dart';

class LinkForm extends StatefulWidget {
  const LinkForm({Key? key}) : super(key: key);

  @override
  State<LinkForm> createState() => _LinkFormState();
}

class _LinkFormState extends State<LinkForm> {
  TextEditingController _qrTopDecorationTextEditingController =
      TextEditingController();
  TextEditingController _qrStringTextEditingController =
      TextEditingController();
  TextEditingController _qrBottomDecorationTextEditingController =
      TextEditingController();

  Color backgroundColor = Colors.white;
  Color foregroundColor = Colors.black;

  changeColor(colors, key) {
    if (key == 'Background Color') {
      backgroundColor = colors;
    } else {
      foregroundColor = colors;
    }
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                HeadingWithDivider(
                  label: 'QR Content',
                ),
                TextField(
                  controller: _qrStringTextEditingController,
                  decoration: InputDecoration(label: Text('Link')),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: const Color(0xFFF2F2F7),
            child: Column(
              children: [
                HeadingWithDivider(
                  label: 'QR Customize',
                ),
                ColorPickerRow(
                  label: 'Background Color',
                  selectedColor: backgroundColor,
                  changeColor: changeColor,
                ),
                ColorPickerRow(
                  label: 'Foreground Color',
                  selectedColor: foregroundColor,
                  changeColor: changeColor,
                ),
                TextField(
                  controller: _qrTopDecorationTextEditingController,
                  decoration: InputDecoration(label: Text('Top QR Text')),
                ),
                TextField(
                  controller: _qrBottomDecorationTextEditingController,
                  decoration: InputDecoration(label: Text('Bottom QR Text')),
                ),
                TextButton(
                  onPressed: () {
                    if(_qrStringTextEditingController.text.isEmpty){
                      DialogHelper().showMessageOnlyAlertDialog(context, "Please fill the link", 'Error');
                      return;
                    }
                    Navigator.of(context)
                        .pushNamed(QRScreen.routeName, arguments: {
                      'content': _qrStringTextEditingController!.text.isEmpty
                          ? null
                          : _qrStringTextEditingController!.text,
                      'backgroundQR': backgroundColor,
                      'foregroundQR': foregroundColor,
                      'bottomText':
                          _qrBottomDecorationTextEditingController!.text.isEmpty
                              ? null
                              : _qrBottomDecorationTextEditingController!.text,
                      'upperText':
                          _qrTopDecorationTextEditingController!.text.isEmpty
                              ? null
                              : _qrTopDecorationTextEditingController!.text
                    });
                  },
                  child: const Text('GENERATE'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeadingWithDivider extends StatelessWidget {
  final String label;

  const HeadingWithDivider({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 15,
      ),
      Text(label,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 5,
      ),
    ]);
  }
}
