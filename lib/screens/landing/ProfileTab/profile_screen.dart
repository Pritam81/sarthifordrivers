import 'package:flutter/material.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Color(0xFF1C1C1E),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to edit page
            },
            icon: const Icon(Icons.edit, color: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          _buildProfileHeader(),
          const SizedBox(height: 10),
          Expanded(child: _buildProfileDetails()),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/300",
          ), // Replace with your URL
        ),
        const SizedBox(height: 12),
        const Text(
          "Pritam Kumar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1C1C1E),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Driver ID: DRI123456",
          style: TextStyle(color: Colors.grey[600], fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildProfileDetails() {
    final Map<String, IconData> infoIcons = {
      "Email": Icons.email,
      "Phone": Icons.phone,
      "Gender": Icons.person_outline,
      "State": Icons.map_outlined,
      "City": Icons.location_city,
      "Address": Icons.home_outlined,
      "Joined": Icons.calendar_today_outlined,
    };

    final Map<String, String> userInfo = {
      "Email": "pritam@example.com",
      "Phone": "+91 9876543210",
      "Gender": "Male",
      "State": "Sikkim",
      "City": "Gangtok",
      "Address": "123, Hilltop Road, Gangtok",
      "Joined": "12 July 2025",
    };

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: userInfo.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        String key = userInfo.keys.elementAt(index);
        String value = userInfo[key]!;
        IconData icon = infoIcons[key]!;

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Color(0x11000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF2758AD), size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1C1C1E),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.white,
      child: ElevatedButton.icon(
        onPressed: () {
          // Logout logic here
        },
        icon: const Icon(Icons.logout),
        label: const Text("Logout"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
