import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_automation/widgets/iot_card.dart';

final _firestore = FirebaseFirestore.instance;


class Bedroom1Page extends StatefulWidget {
  const Bedroom1Page({Key? key}) : super(key: key);

  @override
  State<Bedroom1Page> createState() => _Bedroom1PageState();
}

class _Bedroom1PageState extends State<Bedroom1Page> {
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
                    isOn: switches[1].get('1'),
                    icon: Icons.lightbulb_outline,
                    name: 'Main Light',
                  ),
                  IotCard(
                    isOn: switches[1].get('2'),
                    icon: Icons.air,
                    name: 'Air Conditioner',
                  ),
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}
