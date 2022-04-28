import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_automation/pages/bedroom1_page.dart';
import 'package:home_automation/pages/bedroom2_page.dart';
import 'package:home_automation/pages/livingroom_page.dart';
import 'package:home_automation/widgets/main_drawer.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EZ Home'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Living Room'),
                Text('Bedroom'),
                // Text('Bedroom 2'),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                LivingRoomPage(),
                Bedroom1Page(),
                // Bedroom2Page(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
