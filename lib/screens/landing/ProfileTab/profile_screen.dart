import 'package:flutter/material.dart';
import 'package:saarthi_for_drivers/utils/colors.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromARGB(255, 25, 86, 135), Color(0xFF63C2EF)],
              ),
            ),
          ),

          // White Bottom Sheet
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  // Name and ID
                  const Text(
                    "Pritam Kumar",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Driver ID: FTIPB8723",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          profileCard(Icons.phone, "Phone", "+91 8101525213"),
                          profileCard(
                            Icons.email,
                            "Email",
                            "pritam.kumar@example.com",
                          ),
                          profileCard(Icons.male, "Gender", "Male"),
                          profileCard(
                            Icons.location_on,
                            "Location",
                            "Gangtok, Sikkim",
                          ),
                          profileCard(
                            Icons.home,
                            "Address",
                            "Tadong, East Sikkim",
                          ),
                          profileCard(
                            Icons.calendar_today,
                            "Joined On",
                            "22 Feb 2024",
                          ),

                          const SizedBox(height: 30),

                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Edit logic
                                },
                                icon: const Icon(Icons.edit, size: 18),
                                label: const Text("Edit Profile"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              OutlinedButton.icon(
                                onPressed: () {
                                  // Logout logic
                                },
                                icon: const Icon(Icons.logout, size: 18),
                                label: const Text("Logout"),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: primaryColor,
                                  side: BorderSide(color: primaryColor),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Profile Details
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Profile Picture with white border
          Positioned(
            top: 65,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/men/45.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileCard(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 26, color: primaryColor),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 13.5, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
