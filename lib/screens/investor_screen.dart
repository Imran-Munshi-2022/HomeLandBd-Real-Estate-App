import 'package:flutter/material.dart';

// Import all THREE detail pages
import 'invproject_detail_screen.dart';
import 'two_invproject_detail_screen.dart';
import 'thr_invproject_detail_screen.dart';

class InvestorScreen extends StatelessWidget {
  const InvestorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invest'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search investment projects...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Investment Opportunities',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Vertical List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildProjectCard(context, index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, int index) {
    final List<String> projectImages = [
      'h1.jpg',
      'h3.jpg',
      'h2.jpg',
    ];

    final List<String> titles = [
      'Bay Hills',
      'Bay Breeze',
      'Bay Sands',
    ];

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          
          // NAVIGATION LOGIC UPDATED HERE
          
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => InvProjectDetailScreen(
                  imagePath: projectImages[index],
                  title: titles[index],
                ),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TwoInvProjectDetailScreen(
                  imagePath: projectImages[index],
                  title: titles[index],
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ThrInvProjectDetailScreen(
                  imagePath: projectImages[index],
                  title: titles[index],
                ),
              ),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/${projectImages[index]}',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
