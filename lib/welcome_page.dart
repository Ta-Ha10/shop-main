import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Women\'s Tops',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isGridView = true;

  final List<String> imagePaths = [
    'assets/images/Image1.jpg',
    'assets/images/IMG-20241229-WA0019.jpg',
    'assets/images/IMG-20241229-WA0020.jpg',
    'assets/images/IMG-20241229-WA0021.jpg',
    'assets/images/IMG-20241229-WA0022.jpg',
    'assets/images/k-x-i-t-h-v-i-s-u-a-l-s-4ecCpwg62Kk-unsplash.jpg',
    'assets/images/kal-visuals-d5GlpSOAzzg-unsplash.jpg',
    'assets/images/photo_2024-12-29_02-20-06.jpg',
    'assets/images/photo_2024-12-29_02-20-08.jpg',
    'assets/images/photo_2024-12-29_02-20-09.jpg',
    'assets/images/photo_2024-12-29_02-20-10.jpg',
    'assets/images/photo_2024-12-29_02-20-11.jpg',
    'assets/images/photo_2024-12-29_02-20-12.jpg',
    'assets/images/photo_2024-12-29_02-20-13.jpg',
    'assets/images/photo_2024-12-29_02-20-13 (2).jpg',
    'assets/images/photo_2024-12-29_02-20-14.jpg',
    'assets/images/photo_2024-12-29_02-20-14 (3).jpg',
    'assets/images/photo_2024-12-29_02-20-14 (4).jpg',
    'assets/images/photo_2024-12-29_02-20-15.jpg',
    'assets/images/photo_2024-12-29_02-20-15 (3).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Women's Tops"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Add search functionality
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          // Horizontal Category List
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              children: [
                _buildCategoryItem("T-Shirts"),
                _buildCategoryItem("Crop Tops"),
                _buildCategoryItem("Blouses"),
              ],
            ),
          ),
          // Sort and Filter Row
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price: Lowest to High"),
                IconButton(
                  icon: Icon(isGridView ? Icons.grid_view : Icons.list),
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView;
                    });
                  },
                ),
              ],
            ),
          ),
          // Product Display
          Expanded(
            child: isGridView
                ? GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(imagePaths[index]);
                    },
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(imagePaths[index]);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Bag'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return GestureDetector(
      onTap: () {
        print("$title selected");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(String imagePath) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    '-20%',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Blouse', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Dorothy Perkins', style: TextStyle(fontSize: 12)),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    Icon(Icons.star_border, size: 16),
                    Icon(Icons.star_border, size: 16),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$15',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$12',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
