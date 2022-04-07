import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key? key}) : super(key: key);
  static const routeName = '/qr';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> dataQR =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // print('this is qr');
    // print(dataQR!['backgroundQR']);
    // print(dataQR!['foregroundQR']);
    // print(dataQR!['content']);
    print(dataQR!['upperText']);
    print(dataQR!['bottomText']);

    return Scaffold(
      appBar: AppBar(
        title: Text('GENERATED QR'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F7),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (dataQR['upperText'] != null) Text(dataQR!['upperText']),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
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
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2.0,
                        blurRadius: 4,
                        offset: Offset(-3.0, -3.0)),
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2.0,
                        blurRadius: 4 / 2,
                        offset: Offset(-3.0, -3.0)),
                  ],
                ),
                child: QrImage(
                  backgroundColor: dataQR!['backgroundQR'],
                  foregroundColor: dataQR!['foregroundQR'],
                  data: dataQR!['content'],
                  version: QrVersions.auto,
                  size: 220,
                  padding: EdgeInsets.all(10),
                ),
              ),
              if (dataQR['bottomText'] != null) Text(dataQR!['bottomText'])
            ],
          ),
        ),
      ),
    );
  }
}
