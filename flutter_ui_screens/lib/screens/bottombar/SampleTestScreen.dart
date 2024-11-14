import 'package:flutter/material.dart';

import '../widgets/BalanceCard.dart';

class SampleTestPage extends StatefulWidget {
  String pageTitle;

  SampleTestPage(this.pageTitle, {super.key});

  @override
  State<SampleTestPage> createState() => _SampleTestPageState();
}

class _SampleTestPageState extends State<SampleTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.pageTitle)),
    );
  }
}
