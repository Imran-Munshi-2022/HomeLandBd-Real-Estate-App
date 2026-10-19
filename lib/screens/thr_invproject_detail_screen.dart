import 'package:flutter/material.dart';

class ThrInvProjectDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const ThrInvProjectDetailScreen({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section + Back Button

            Stack(
              children: [
                Image.asset(
                  'assets/images/$imagePath',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Colors.black, size: 24),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // Content Section

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Bay Sands',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Serif',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        icon: Icons.email,
                        label: 'Email',
                        color: Colors.grey[200]!,
                        textColor: Colors.black,
                      ),
                      _buildActionButton(
                        icon: Icons.call,
                        label: 'Call',
                        color: const Color(0xFF1E3C72),
                        textColor: Colors.white,
                      ),
                      _buildActionButton(
                        icon: Icons.location_on,
                        label: 'Location',
                        color: Colors.grey[200]!,
                        textColor: Colors.black,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // SUMMARY

                  const Text(
                    'Summary:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Bay Sands,Discover the Ultimate Luxury Hotel Suite – a testament to opulence, an embodiment of exclusivity, and an invitation to elevate your living experience. Bay Sands Hotel, Coxs Bazar is a 5 Star hotel by Goldsands Hotels & Resorts, at Kolatoli invites you to be a part of this exquisite journey. Choose your luxury sea view hotel suites from 600 sqft to 9000 sqft. Designed by top ranked world class Singaporean architect firm Surbana Jurong. Your journey into a realm of luxury begins with us. Our commitment to exceptional service ensures that every desire is met with personalized attention, making your stay an experience that lingers in memory.',
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),

                  const SizedBox(height: 20),

                  // PROPERTY INFORMATION

                  const Text(
                    'Property Information:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Location: Coxs Bazar\n• Facilities: Swimming Pool, Spa, Conference Hall, Restaurant\n• Year Built: 2023',
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),

                  const SizedBox(height: 30),

                  // PHOTO GALLERY (GRID 4)

                  const Text(
                    'Photo Gallery',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.3,
                    children: [
                      _gridImage("gallery1.jpg"),
                      _gridImage("gallery2.jpg"),
                      _gridImage("gallery3.jpg"),
                      _gridImage("gallery4.jpg"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // FLOOR PLAN (GRID 2)

                  const Text(
                    'Floor Plan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.2,
                    children: [
                      _gridImage("floor1.jpg"),
                      _gridImage("floor2.jpg"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // CATEGORY OF OWNERSHIP (Single Image Box)

                  const Text(
                    'CATEGORY OF OWNERSHIP',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // CATEGORY OF OWNERSHIP Image Here
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/category.jpg"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  // Grid Image Widget
  
  Widget _gridImage(String imgName) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        "assets/images/$imgName",
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
        ),
      ),
    );
  }

  
  // Action Button Widget
  
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: 100,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: textColor == Colors.white
                  ? Colors.white
                  : const Color(0xFF1E3C72),
              size: 18),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
