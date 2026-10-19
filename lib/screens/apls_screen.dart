import 'package:flutter/material.dart';
import 'apls_det_screen.dart';

class AplsScreen extends StatelessWidget {
  const AplsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for Apartments
    final List<Map<String, String>> apartments = [
      {
        'title': 'Podda Building',
        'image': 'assets/images/a1.jpg',
        'location': 'Dhanmondi, Dhaka',
      },
      {
        'title': 'Bani Villa',
        'image': 'assets/images/a2.jpg',
        'location': 'Monipur, Mirpur, Dhaka',
      },
      {
        'title': 'Nibir Villa',
        'image': 'assets/images/h3e1.jpg',
        'location': 'Sector 13, Uttara, Dhaka',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apartment List'),
        backgroundColor: const Color(0xFF5B6FD8),
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search apartments...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Available Apartments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          // List of Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: apartments.length,
              itemBuilder: (context, index) {
                return _buildPropertyCard(context, apartments[index]);
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
        // <--- THIS MAKES THE CARD CLICKABLE
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AplsDetScreen(
                imagePath: data['image']!,
                title: data['title']!,
                // I removed 'price' and 'location' here because your
                // AplsDetScreen only accepts imagePath and title.
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[300],
              child: Image.asset(
                data['image']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data['location']!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
