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

          Expanded(
            child: ListView.builder(
              itemCount: jobPost.length,
              itemBuilder: (BuildContext context, int index) {
                return jobPostCardDesign(
                  jobPost[index]["Heading"] ?? "",
                  jobPost[index]["Brief"] ?? "",
                  jobPost[index]["duration"] ?? "",
                  jobPost[index]["Location"] ?? "",
                  jobPost[index]["salary"] ?? "",
                  jobPost[index]["Posted on"] ?? "",
                );
              },
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 2,
              //offset: Offset(10, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Job Title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.work_history, color: primaryColor),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    heading,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: spacing),

            /// Brief Description
            Text(
              brief,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14.5,
                height: 1.5,
                color: Color(0xFF44474A),
              ),
            ),

            const SizedBox(height: 6),

            /// Details link
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.info_outline, size: 18, color: primaryColor),
              label: Text(
                "View Full Details",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),

            const SizedBox(height: spacing),

            /// Info grid 1
            Row(
              //mainAxisAlignment: MainAxisAlignment,
              children: [
                _infoBlock(Icons.access_time, "Duration", duration),
                SizedBox(width: 100),
                _infoBlock(Icons.location_on_outlined, "Location", location),
              ],
            ),

            const SizedBox(height: spacing),

            /// Info grid 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoBlock(Icons.monetization_on, "Salary", "₹$salary"),
                _infoBlock(Icons.calendar_today, "Posted On", date),
              ],
            ),

            const SizedBox(height: spacing + 4),

            /// 🎙️ Voice Note
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EFFA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.play_circle_fill,
                    size: 30,
                    color: Colors.lightGreen,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Voice note from owner",
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                            color: darkTextColor,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Duration: 00:32 sec",
                          style: TextStyle(fontSize: 13, color: greyTextColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: spacing + 2),

            /// Buttons Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border, size: 18),
                    label: const Text("Save"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.send_rounded, size: 18),
                    label: const Text("Apply"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
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

  Widget _infoBlock(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: greyTextColor),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12.5, color: greyTextColor),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
