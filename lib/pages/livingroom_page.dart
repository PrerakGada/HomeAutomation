import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_automation/widgets/iot_card.dart';

final _firestore = FirebaseFirestore.instance;

class LivingRoomPage extends StatefulWidget {
  const LivingRoomPage({Key? key}) : super(key: key);

  @override
  State<LivingRoomPage> createState() => _LivingRoomPageState();
}

class _LivingRoomPageState extends State<LivingRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: StreamBuilder<QuerySnapshot>(
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
                        isOn: switches[0].get('1'),
                        icon: Icons.lightbulb_outline,
                        name: 'Main Light',
                      ),
                      IotCard(
                        isOn: switches[0].get('2'),
                        icon: Icons.air,
                        name: 'Air Conditioner',
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
