import 'package:flutter/material.dart';

class TwoInvProjectDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const TwoInvProjectDetailScreen({
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
                      'Bay Breeze',
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
                    'Bay Breeze, Featuring beautiful architecture and modern amenities, Hotel Bay Breeze are iconic upscale luxurious 5-Star hotels situated in the heart of & Kuakata. Kuakata 5-star gem is not just a retreat; it\'s a promise of returns on your investment and a gateway to a world where natural splendor meets contemporary elegance. Join us in this venture, where the waves of the Bay of Bengal echo the possibilities of a secure and prosperous investment. Invest in Kuakata – where sea, sky, and luxury converge in harmony',
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
                    '• Location: Kuakata\n• Facilities: Swimming Pool, Spa, Conference Hall, Restaurant\n• Year Built: 2023',
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
