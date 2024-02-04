import 'package:flutter/material.dart';

class SiparisTakipScreen extends StatefulWidget {
  const SiparisTakipScreen({super.key});

  @override
  State<SiparisTakipScreen> createState() => _SiparisTakipScreenState();
}

class _SiparisTakipScreenState extends State<SiparisTakipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text('Sipariş Takibi')),
      body:Column(
      children: [
        Image.asset("assets/images/takip.png",width: 500,)
      ]
    ),
    );
  }
}
