import 'package:flutter/material.dart';
import 'buldls_det_screen.dart';

class BuldlsScreen extends StatelessWidget {
  const BuldlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for Buildings
    final List<Map<String, String>> buildings = [
      {
        'title': 'Snigdha Building',
        'image': 'assets/images/b1.jpg',
        'location': 'Sector 13, Uttara, Dhaka',
      },
      {
        'title': 'Nibir Villa',
        'image': 'assets/images/b2.jpg',
        'location': 'Monipur, Mirpur, Dhaka',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Building List'),
        backgroundColor: const Color(0xFF5B6FD8),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search buildings...',
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
              itemCount: buildings.length,
              itemBuilder: (context, index) {
                return _buildPropertyCard(context, buildings[index]);
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
        onTap: () {
          // Navigates to the detail screen we created in Step 1
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuldlsDetScreen(
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
                    child: Icon(Icons.business, size: 50, color: Colors.grey)),
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
