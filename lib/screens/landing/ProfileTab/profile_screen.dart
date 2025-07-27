import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 36, 112, 174),
                  const Color.fromARGB(255, 99, 194, 239),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: MediaQuery.of(context).size.width / 2 - 60,

            child: CircleAvatar(
              backgroundColor: Colors.white,

              radius: 60,
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/men/45.jpg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
