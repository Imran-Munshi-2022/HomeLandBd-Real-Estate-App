import 'package:flutter/material.dart';
import 'landls_det_screen.dart'; // Import the detail screen

class LandlsScreen extends StatelessWidget {
  const LandlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for Land
    final List<Map<String, String>> lands = [
      {
        'title': 'Green Valley Plot',
        'image': 'assets/images/l1.jpg',
        'location': 'Amin Model Town, Savar, Dhaka',
      },
      {
        'title': 'Sunset View Land',
        'image': 'assets/images/l2.jpg',
        'location': 'Gazipur Sath Mashjid Road, Gazipur',
      },
      {
        'title': 'A. Latif Residence Area',
        'image': 'assets/images/l3.jpg',
        'location': 'Narayanganj, Dhaka',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Land List'),
        backgroundColor: const Color(0xFF5B6FD8),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search land...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: lands.length,
              itemBuilder: (context, index) {
                return _buildPropertyCard(context, lands[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, Map<String, String> data) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // Added InkWell for click functionality
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandlsDetScreen(
                imagePath: data['image']!,
                title: data['title']!,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: Image.asset(
                data['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.landscape, size: 50, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['title']!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(data['location']!,
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
