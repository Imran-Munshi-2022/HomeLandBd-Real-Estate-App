import 'package:flutter/material.dart';

class BuldlsDetScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const BuldlsDetScreen({
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
                  imagePath,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(Icons.business,
                        size: 80, color: Colors.grey),
                  ),
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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Serif',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Call For Price',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5B6FD8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(icon: Icons.email, label: 'Email'),
                      _buildActionButton(
                          icon: Icons.call, label: 'Call', isPrimary: true),
                      _buildActionButton(
                          icon: Icons.location_on, label: 'Location'),
                    ],
                  ),

                  const SizedBox(height: 25),
                  const Text('Summary:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'This commercial building features modern architecture, high-speed lifts, and parking space. Located in the prime business area. Ideal for offices, retail shops, and showrooms. Close to public transport other shops and market .',
                    style: TextStyle(
                        fontSize: 15, height: 1.5, color: Colors.black87),
                  ),
                  const SizedBox(height: 20),
                  const Text('Property Owner Details:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    'Name: Mr. Kamal Hossain\nPhone: +880171111222\nEmail: kamal.hossain@email.com',
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

  Widget _buildActionButton(
      {required IconData icon, required String label, bool isPrimary = false}) {
    return Container(
      width: 100,
      height: 45,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF1E3C72) : Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade400, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isPrimary ? Colors.white : Colors.black, size: 18),
          const SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  color: isPrimary ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
