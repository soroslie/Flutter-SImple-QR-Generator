import 'package:flutter/material.dart';
import 'package:vcard_to_qr/components/form/link_form.dart';

import '../components/form/v_card_form.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);
  static const routeName = '/form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon:const Icon(Icons.contacts)),
                  Tab(icon:const Icon(Icons.text_fields)),
                ],
              ),
              title: const Text('Type QR'),
            ),
            body: TabBarView(
              children: [
                VcardForm(),
                LinkForm()
              ],
            ),
          ),
        ),
    );

  }
}

