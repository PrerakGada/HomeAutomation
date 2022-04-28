import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_automation/widgets/iot_card.dart';

final _firestore = FirebaseFirestore.instance;

class Bedroom2Page extends StatefulWidget {
  const Bedroom2Page({Key? key}) : super(key: key);

  @override
  State<Bedroom2Page> createState() => _Bedroom2PageState();
}

class _Bedroom2PageState extends State<Bedroom2Page> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('devices').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                final switches = snapshot.data!.docs;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IotCard(
                      isOn: switches[2].get('1'),
                      icon: Icons.lightbulb_outline,
                      name: 'Main Light',
                      toggleFunction: () {},
                    ),
                    IotCard(
                      isOn: switches[2].get('2'),
                      icon: Icons.air,
                      name: 'Air Conditioner',
                      toggleFunction: () {},
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
