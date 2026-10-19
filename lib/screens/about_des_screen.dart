import 'package:flutter/material.dart';

class AboutDesScreen extends StatelessWidget {
  const AboutDesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5FF),
      appBar: AppBar(
        title: const Text('About Developer'),
        backgroundColor: const Color(0xFF5B6FD8),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              //  Developer Card
              _buildDeveloperCard(
                context,
                name: 'Md. Zamirul Islam Reyad',
                id: '222-15-6224',
                dept: 'CSE',
                imagePath: 'assets/images/reyad.png',
              ),
              const SizedBox(height: 20),

              _buildDeveloperCard(
                context,
                name: 'Imran Munshi',
                id: '222-15-6376',
                dept: 'CSE',
                imagePath: 'assets/images/mun.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperCard(
    BuildContext context, {
    required String name,
    required String id,
    required String dept,
    required String imagePath, // Added imagePath parameter
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            // Image Section
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE8EAF6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  imagePath,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.apartment,
                        size: 40, color: Color(0xFF5B6FD8));
                  },
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'HomeLandBd',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),

            // Developer Info
            Text(
              'Developer: $name',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'ID: $id',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Dept: $dept',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
