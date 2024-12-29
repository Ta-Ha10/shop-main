import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isGridView = true;

  // Updated list of image paths for the grid/list view
  final List<String> imagePaths = [
    'images/assets/Image1.jpg',
    'images/assets/Image2.jpg',
    'images/assets/Image3.jpg',
    'images/assets/Image4.jpg',
    'images/assets/Image5.jpg',
    'images/assets/Image6.jpg',
    'images/assets/Image7.jpg',
    'images/assets/Image8.jpg',
    'images/assets/Image9.jpg',
    'images/assets/Image10.jpg',
    'images/assets/Image12.jpg',
    'images/assets/Image13.jpg',
    'images/assets/Image14.jpg',
    'images/assets/Image15.jpg',
    'images/assets/Image16.jpg',
    'images/assets/Image17.jpg',
    'images/assets/Image18.jpg',
    'images/assets/Image19.jpg',
    'images/assets/Image20.jpg',
    'images/assets/Image21.jpg',
    'images/assets/Image23.jpg',
    'images/assets/Image24.jpg',
    'images/assets/Image25.jpg',
    'images/assets/Image26.jpg',
    'images/assets/Image27.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Women's Tops"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
        onTap: (index) {},
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
