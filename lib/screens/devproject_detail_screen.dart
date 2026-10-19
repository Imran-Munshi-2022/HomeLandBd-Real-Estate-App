import 'package:flutter/material.dart';

class DevProjectDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const DevProjectDetailScreen({
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
            // Top Image Section with Back Button
            Stack(
              children: [
                Image.asset(
                  'assets/images/$imagePath',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child:
                        const Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
                ),
                // Back Button overlay
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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title / Call For Price
                  const Center(
                    child: Text(
                      'Call For Price',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Serif',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Action Buttons Row (Email, Call, Location)
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
                        color: const Color(0xFF1E3C72), // Dark Blue color
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

                  // Summary Section
                  const Text(
                    'Summary:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This wonderful residence is nestled on a large level in the desirable location of Mirpur. The home retains the value of peaceful living while being conveniently close to shops, school and transport. Standing on a strong structure.',
                    style: TextStyle(
                        fontSize: 15, height: 1.5, color: Colors.black87),
                  ),

                  const SizedBox(height: 20),

                  // Property Information Section
                  const Text(
                    'Property Information:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '4 Katha of total Residential Plot. This is a beautiful 3 beds and 2 baths unit and 2 separated Units. Here is supply line of gas and generator facility for 24/7.',
                    style: TextStyle(
                        fontSize: 15, height: 1.5, color: Colors.black87),
                  ),

                  const SizedBox(height: 20),

                  // Owner Details Title
                  const Text(
                    'Property Owner Details:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Name: Mr. Reyad Ali\nPhone: +880123456789\nEmail: reyadali245@gmail.com',
                    style: TextStyle(
                        fontSize: 15, height: 1.5, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          )
        ],
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
