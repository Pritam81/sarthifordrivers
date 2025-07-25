import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:saarthi_for_drivers/utils/colors.dart';

class OneTimeRideScreen extends StatefulWidget {
  const OneTimeRideScreen({super.key});

  @override
  State<OneTimeRideScreen> createState() => _OneTimeRideScreenState();
}

class _OneTimeRideScreenState extends State<OneTimeRideScreen> {
  final List<Map<String, String>> rideDetailsDemoData = [
    {
      "userImageUrl": "https://randomuser.me/api/portraits/men/45.jpg",
      "userName": "Ravi Sharma",
      "pickUplocation": "MG Marg, Gangtok",
      "destination": "Siliguri Bus Stand",
      "userDistance": "5.2 km",
      "tripDuration": "1 hr 45 mins",
      "fare": "₹850",
      "timeToReachUser": "8 mins",
    },
    {
      "userImageUrl": "https://randomuser.me/api/portraits/women/68.jpg",
      "userName": "Priya Sen",
      "pickUplocation": "Lal Bazar, Kolkata",
      "destination": "Howrah Railway Station",
      "userDistance": "3.8 km",
      "tripDuration": "35 mins",
      "fare": "₹210",
      "timeToReachUser": "4 mins",
    },
    {
      "userImageUrl": "https://randomuser.me/api/portraits/men/12.jpg",
      "userName": "Ajay Mehta",
      "pickUplocation": "Sector 62, Noida",
      "destination": "IGI Airport, Delhi",
      "userDistance": "23.4 km",
      "tripDuration": "1 hr 10 mins",
      "fare": "₹1250",
      "timeToReachUser": "12 mins",
    },
    {
      "userImageUrl": "https://randomuser.me/api/portraits/women/30.jpg",
      "userName": "Simran Kaur",
      "pickUplocation": "Juhu Beach, Mumbai",
      "destination": "CST Station",
      "userDistance": "18.6 km",
      "tripDuration": "55 mins",
      "fare": "₹980",
      "timeToReachUser": "6 mins",
    },
    {
      "userImageUrl": "https://randomuser.me/api/portraits/men/95.jpg",
      "userName": "Rahul Das",
      "pickUplocation": "Park Street, Kolkata",
      "destination": "Salt Lake Sector V",
      "userDistance": "9.1 km",
      "tripDuration": "40 mins",
      "fare": "₹360",
      "timeToReachUser": "5 mins",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "One Time Ride",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero, //
              itemCount: rideDetailsDemoData.length,
              itemBuilder: (context, index) {
                final ride = rideDetailsDemoData[index];
                return oneTimeRideCardDesign(ride);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget oneTimeRideCardDesign(Map<String, String> ride) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      color: const Color(0xFFF9FBFF),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Top Row with Avatar + Info + Circular Timer
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(ride["userImageUrl"]!),
                ),
                const SizedBox(width: 12),

                /// Name & reach time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ride["userName"] ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Reaching in ${ride["timeToReachUser"]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ride["fare"] ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2758AD),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Countdown Circular Timer
                CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: 0.7, // Use logic here based on your timer
                  center: const Text(
                    "45s",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color.fromARGB(255, 34, 181, 71),
                  backgroundColor: Colors.grey.shade300,
                ),
              ],
            ),

            const SizedBox(height: 14),

            /// Locations
            Row(
              children: [
                const Icon(
                  Icons.my_location_outlined,
                  size: 18,
                  color: Colors.red,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    ride["pickUplocation"] ?? "",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.flag_outlined, size: 18, color: Colors.green),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    ride["destination"] ?? "",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Duration and Distance
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        ride["tripDuration"] ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D4263),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Trip Duration",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        ride["userDistance"] ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D4263),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Distance",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.close, color: Color(0xFFB00020)),
                    label: const Text(
                      "Decline",
                      style: TextStyle(color: Color(0xFFB00020)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFB00020)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Accept"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2758AD),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
