import 'package:flutter/material.dart';
import 'package:home_automation/screens/login_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.only(left: 16.0, top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Prerak',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Do you really want to logout?'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, LoginScreen.id);
                                    },
                                    child: Text('Logout'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                    // Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
