import 'package:flutter/material.dart';

class OneTimeRideScreen extends StatefulWidget {
  const OneTimeRideScreen({super.key});

  @override
  State<OneTimeRideScreen> createState() => _OneTimeRideScreenState();
}

class _OneTimeRideScreenState extends State<OneTimeRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("One Time Ride")),
    );
  }
}
