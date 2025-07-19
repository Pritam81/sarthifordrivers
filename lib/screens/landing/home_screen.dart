import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saarthi_for_drivers/controller/secondary_tab_controller.dart';
import 'package:saarthi_for_drivers/screens/landing/HomeTab/find_a_job_screen.dart';
import 'package:saarthi_for_drivers/screens/landing/HomeTab/one_time_ride_screen.dart';
import 'package:saarthi_for_drivers/utils/colors.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SecondaryTabController _tabController = Get.put(
    SecondaryTabController(),
  );
  final BottomNavController _bottomNavController = Get.put(
    BottomNavController(),
  );

  final List<String> secondaryTabs = ["Find a Job", "One Time Ride"];
  final List<Widget> bottomScreens = [
    HomeContent(),
    Center(child: Text("🛠 Services View", style: TextStyle(fontSize: 16))),
    Center(child: Text("📋 Jobs View", style: TextStyle(fontSize: 16))),
    Center(child: Text("👤 Profile View", style: TextStyle(fontSize: 16))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => bottomScreens[_bottomNavController.selectedIndex.value]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        child: Obx(
          () => SizedBox(
            height: 65,
            child: BottomNavigationBar(
              currentIndex: _bottomNavController.selectedIndex.value,
              onTap: _bottomNavController.changeTab,
              backgroundColor: const Color(0xFF2758AD),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 13,
              unselectedFontSize: 12,
              elevation: 8,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.miscellaneous_services_outlined),
                  label: 'Services',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline),
                  label: 'Jobs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------- Home Content With Toggle --------------------

class HomeContent extends StatelessWidget {
  final SecondaryTabController _tabController = Get.find();
  final List<String> secondaryTabs = ["Find a Job", "One Time Ride"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Center(
          child: Text(
            "Sarthi",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 15),

        /// Toggle Tabs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Container(
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF1FB),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: List.generate(secondaryTabs.length, (index) {
                  bool isSelected = _tabController.selectedIndex.value == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _tabController.setTab(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? const Color.fromARGB(255, 41, 111, 240)
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          secondaryTabs[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : primaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// This part must be reactive
        Expanded(
          child: Obx(() {
            if (_tabController.selectedIndex.value == 1) {
              return OneTimeRideScreen();
            } else {
              return FindAJobScreen();
            }
          }),
        ),
      ],
    );
  }
}
