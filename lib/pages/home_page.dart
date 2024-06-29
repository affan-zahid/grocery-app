import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define categories and items data
  int _calculateItemIndex(List<Map<String, dynamic>> categories, int categoryIndex, int itemIndex) {
    int index = 0;
    for (int i = 0; i < categoryIndex; i++) {
      index += (categories[i]['items'].length as int); // Explicit cast to int
    }
    return index + itemIndex;
  }

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Fruits',
      'items': [
        {'name': 'Apple', 'price': '2.99', 'image': 'lib/images/apple.png', 'color': Colors.red},
        {'name': 'Banana', 'price': '1.99', 'image': 'lib/images/banana.png', 'color': Colors.yellow},
        {'name': 'Orange', 'price': '3.49', 'image': 'lib/images/orange.png', 'color': Colors.orange},
        {'name': 'Cherry', 'price': '2.79', 'image': 'lib/images/cherry.png', 'color': Colors.red},
      ],
    },
    {
      'name': 'Vegetables',
      'items': [
        {'name': 'Turnip', 'price': '4.99', 'image': 'lib/images/shaljam.png', 'color': Colors.red},
        {'name': 'Onion', 'price': '3.49', 'image': 'lib/images/piyaj.png', 'color': Colors.pink},
        {'name': 'Peas', 'price': '2.99', 'image': 'lib/images/matar.png', 'color': Colors.green},
        {'name': 'Potato', 'price': '5.99', 'image': 'lib/images/aalu.png', 'color': Colors.brown},
      ],
    },
    {
      'name': 'Dairy Products',
      'items': [
        {'name': 'Yogurt', 'price': '9.99', 'image': 'lib/images/yogurt.png', 'color': Colors.pink},
        {'name': 'Cheese', 'price': '12.99', 'image': 'lib/images/cheez.png', 'color': Colors.yellow},
        {'name': 'Milk', 'price': '15.99', 'image': 'lib/images/milk.png', 'color': Colors.purple},
        {'name': 'Bread','price': '14.99', 'image': 'lib/images/bread.png', 'color': Colors.brown},
      ],
    },
    {
      'name': 'Soft Drinks',
      'items': [
        {'name': 'Sprite', 'price': '5.99', 'image': 'lib/images/sprite.png', 'color': Colors.green},
        {'name': 'Coke', 'price': '7.99', 'image': 'lib/images/coke.png', 'color': Colors.red},
        {'name': 'Red Bull', 'price': '6.99', 'image': 'lib/images/red-bull.png', 'color': Colors.blue},
        {'name': 'Fanta', 'price': '8.99', 'image': 'lib/images/fanta.png', 'color': Colors.orange},
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey[700],
          ),
        ),
        title: Text(
          'Karachi, Pakistan',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(','),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, categoryIndex) {
                final category = categories[categoryIndex];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        category['name'],
                        style: GoogleFonts.notoSerif(
                          fontSize: 18,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 200, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: category['items'].length,
                        itemBuilder: (context, itemIndex) {
                          final correctedIndex = _calculateItemIndex(categories, categoryIndex, itemIndex);
                          final item = category['items'][itemIndex];
                          return GroceryItemTile(
                            itemName: item['name'],
                            itemPrice: item['price'],
                            imagePath: item['image'],
                            color: item['color'],
                            onPressed: () {
                              final correctedIndex = _calculateItemIndex(categories, categoryIndex, itemIndex);
                              Provider.of<CartModel>(context, listen: false).addItemToCart(correctedIndex);
                            },

                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
        ],

      ),
    );
  }
}




