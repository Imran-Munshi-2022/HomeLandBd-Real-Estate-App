import 'package:flutter/material.dart';
import 'about_des_screen.dart';
import 'apls_screen.dart';
import 'landls_screen.dart';
import 'developer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        // Search functionality
        break;
      case 2:
        // Favorites
        break;
      case 3:
        // Settings
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            // Title Text
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 12.0),
              child: Text(
                'HomeLandBd',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            // Search Bar
            Expanded(
              child: Container(
                height: 35,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30), //  rounded corners
                ),
                child: TextField(
                  controller: _searchController,
                  textAlignVertical:
                      TextAlignVertical.center, // Vertically centers content
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                    prefixIcon:
                        const Icon(Icons.search, color: Colors.grey, size: 18),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image SECTION
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/reyad.png', // Profile image
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 40,
                            color: Theme.of(context).primaryColor,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Asad Mia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'asadmia332.@gmail.com',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Buy Property'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/buy');
              },
            ),
            ListTile(
              leading: const Icon(Icons.sell),
              title: const Text('Sell Property'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sell');
              },
            ),
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text('Development'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/developer');
              },
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text('Investment'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/investor');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('My Favorites'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('My Listings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutDesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Action Buttons
            Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    'Buy',
                    Icons.shopping_bag_outlined,
                    () => Navigator.pushNamed(context, '/buy'),
                  ),
                  _buildActionButton(
                    context,
                    'Sell',
                    Icons.sell_outlined,
                    () => Navigator.pushNamed(context, '/sell'),
                  ),
                  _buildActionButton(
                    context,
                    'Dev.',
                    Icons.apartment_outlined,
                    () => Navigator.pushNamed(context, '/developer'),
                  ),
                  _buildActionButton(
                    context,
                    'Inv.',
                    Icons.trending_up_outlined,
                    () => Navigator.pushNamed(context, '/investor'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- 1. Apartments/Flats Section ---
            _buildSectionHeader('Appartments For Sale', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AplsScreen()),
              );
            }),
            _buildHorizontalPropertyList([
              {'title': 'Flat For Sale\n2100 sqft', 'image': 'a1'},
              {'title': 'Flat For Sale\n2410 sqft', 'image': 'a2'},
              {'title': 'Flat For Sale\n2232 sqft', 'image': 'h3e1'},
            ]),
            const SizedBox(height: 16),

            // --- 2. Land Section ---
            _buildSectionHeader('Lands For Sale', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandlsScreen()),
              );
            }),
            _buildHorizontalPropertyList([
              {'title': 'LANDS FOR SALE', 'image': 'l1'},
              {'title': 'LANDS FOR SALE', 'image': 'l2'},
              {'title': 'LANDS FOR SALE', 'image': 'l3'},
            ]),
            const SizedBox(height: 16),

            // --- 3. Ongoing Projects (Developer) Section ---
            _buildSectionHeader('Ongoing Projects', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeveloperScreen()),
              );
            }),
            _buildHorizontalPropertyList([
              {'title': 'Ongoing', 'image': 'd1'},
              {'title': 'Ongoing', 'image': 'd2'},
              {'title': 'Ongoing', 'image': 'd3'},
            ]),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onViewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onViewAll,
            child: const Text('View All'),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalPropertyList(List<Map<String, String>> properties) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return _buildPropertyCard(properties[index]);
        },
      ),
    );
  }

  Widget _buildPropertyCard(Map<String, String> property) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  'assets/images/${property['image']}.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                property['title'] ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
