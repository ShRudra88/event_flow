
import 'package:event_flow/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../community_screen/community_screen.dart';
import '../create_event/create_event.dart';
import '../message_screen/message_screen.dart';
import '../profile/admin_profile.dart';
import '../profile/profile.dart';


class BottomBarView extends StatefulWidget {
  final bool isAdmin;

   const BottomBarView({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> widgetOption = [
    HomeScreen(),
    CommunityScreen(),
    CreateEventView(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // If isAdmin is true, replace ProfileScreen with AdminPage
    if (widget.isAdmin) {
      widgetOption[4] = const AdminPage(); // Replace ProfileScreen with AdminPage
    }

    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          onTap: onItemTapped,
          backgroundColor: Colors.blueGrey,
          selectedItemColor: Colors.black,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  currentIndex == 0
                      ? 'assets/Group 43 (1).png'
                      : 'assets/Group 43.png',
                  width: 22,
                  height: 22,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  currentIndex == 1
                      ? 'assets/Group 18340 (1).png'
                      : 'assets/Group 18340.png',
                  width: 22,
                  height: 22,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  currentIndex == 2
                      ? 'assets/Group 18528 (1).png'
                      : 'assets/Group 18528.png',
                  width: 22,
                  height: 22,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  currentIndex == 3
                      ? 'assets/Group 18339 (1).png'
                      : 'assets/Group 18339.png',
                  width: 22,
                  height: 22,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  currentIndex == 4
                      ? 'assets/Group 18341 (1).png'
                      : 'assets/Group 18341.png',
                  width: 22,
                  height: 22,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: widgetOption[currentIndex],
    );
  }
}
