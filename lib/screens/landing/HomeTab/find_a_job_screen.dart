import 'package:flutter/material.dart';
import 'package:saarthi_for_drivers/utils/colors.dart';

class FindAJobScreen extends StatefulWidget {
  const FindAJobScreen({super.key});

  @override
  State<FindAJobScreen> createState() => _FindAJobScreenState();
}

class _FindAJobScreenState extends State<FindAJobScreen> {
  List<Map<String, String>> jobPost = [
    {
      "Heading": "Need a reliable driver for luxury sedan",
      "Brief":
          "Looking for an experienced chauffeur with clean records. Must know city routes well and be punctual. Age: 30-50.",
      "duration": "Full-Time",
      "Location": "Mumbai",
      "salary": "650",
      "Posted on": "12 July 2025",
    },
    {
      "Heading": "Part-time school van driver required",
      "Brief":
          "Should have prior experience with school kids. Valid license and background check mandatory. Morning and afternoon shifts only.",
      "duration": "Part-Time",
      "Location": "Delhi",
      "salary": "300",
      "Posted on": "10 July 2025",
    },
    {
      "Heading": "Driver required for tourist vehicle (SUV/Van)",
      "Brief":
          "Looking for a driver to handle local and outstation trips. Should be fluent in Hindi/English and know tourist routes.",
      "duration": "Contract",
      "Location": "Goa",
      "salary": "700",
      "Posted on": "08 July 2025",
    },
    {
      "Heading": "Personal driver for business executive",
      "Brief":
          "Should have minimum 5 years experience. Must be discreet, reliable, and flexible with timings. Uniform preferred.",
      "duration": "Full-Time",
      "Location": "Bangalore",
      "salary": "900",
      "Posted on": "05 July 2025",
    },
    {
      "Heading": "Delivery van driver for grocery chain",
      "Brief":
          "Required for early morning shifts. Must handle timely deliveries and basic vehicle checks. Training provided.",
      "duration": "Full-Time",
      "Location": "Hyderabad",
      "salary": "450",
      "Posted on": "03 July 2025",
    },
    {
      "Heading": "One-time driver for wedding event",
      "Brief":
          "Need a well-groomed driver for a luxury car rental service for a 2-day wedding event. Accommodation will be provided.",
      "duration": "One-Time",
      "Location": "Jaipur",
      "salary": "200",
      "Posted on": "01 July 2025",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 5),
          Center(
            child: Text(
              "Job Post",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryColor,
                fontSize: 16,
              ),
            ),
          ),

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: jobPost.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return jobPostCardDesign(
          //         jobPost[index]["Heading"] ?? "",
          //         jobPost[index]["Brief"] ?? "",
          //         jobPost[index]["duration"] ?? "",
          //         jobPost[index]["Location"] ?? "",
          //         jobPost[index]["salary"] ?? "",
          //         jobPost[index]["Posted on"] ?? "",
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget jobPostCardDesign(
    String heading,
    String brief,
    String duration,
    String location,
    String salary,
    String date,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F7FB),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              heading,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2758AD),
              ),
            ),

            const SizedBox(height: 8),

            /// Brief Description
            Text(
              brief,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 12),

            /// Divider
            const Divider(thickness: 1, color: Colors.grey),

            /// Details Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconText(Icons.access_time_filled, duration),
                _iconText(Icons.location_on_outlined, location),
              ],
            ),

            const SizedBox(height: 10),

            /// Salary & Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconText(Icons.attach_money, "₹ $salary / month"),
                _iconText(Icons.calendar_today_outlined, "Posted: $date"),
              ],
            ),

            const SizedBox(height: 16),

            /// View Details Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  // Handle details tap
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2758AD),
                ),
                icon: const Icon(Icons.info_outline, size: 18),
                label: const Text(
                  "View Details",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper widget for icon and text row
  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[700]),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 13.5, color: Colors.black87),
        ),
      ],
    );
  }
}
