import 'package:flutter/material.dart';

class IotCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final bool isOn;

  const IotCard({
    Key? key,
    required this.name,
    required this.icon, required this.isOn,
  }) : super(key: key);

  @override
  State<IotCard> createState() => _IotCardState(name, icon, isOn);
}

class _IotCardState extends State<IotCard> {
  final String name;
  final IconData icon;
  bool isOn;

  _IotCardState(this.name, this.icon, this.isOn);

  void toggleSwitch(bool value) {
    if (isOn == false) {
      setState(() {
        isOn = true;
      });
    } else {
      setState(() {
        isOn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Card(
        elevation: 20,
        color: isOn ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: isOn
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 102, 255, 1),
                      Color.fromRGBO(128, 179, 255, 1),

                      // Colors.blueAccent,
                      // Colors.yellow.shade300,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                )
              : const BoxDecoration(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: isOn ? Colors.white : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
              Icon(
                icon,
                color: isOn ? Colors.white : Colors.black,
                size: 30,
              ),
              Switch(
                value: isOn,
                onChanged: toggleSwitch,
                activeColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
