import 'package:flutter/material.dart';
import 'package:vcard_to_qr/screens/form.dart';
import 'package:vcard_to_qr/screens/qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple QR Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormScreen(),
      routes: {
        QRScreen.routeName: (ctx) => QRScreen(),
        FormScreen.routeName: (ctx) => FormScreen(),
      },
    );
  }
}
