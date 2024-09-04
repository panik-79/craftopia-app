import 'package:flutter/material.dart';
import 'HomePage.dart';

class CartPage extends StatelessWidget {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/product1.jpg',
      'name': 'Product 1',
      'price': 'Rs 1500',
      'quantity': 1,
    },
    {
      'image': 'assets/product2.jpg',
      'name': 'Product 2',
      'price': 'Rs 2000',
      'quantity': 2,
    },
    {
      'image': 'assets/product3.jpg',
      'name': 'Product 3',
      'price': 'Rs 1200',
      'quantity': 1,
    },
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on selected index if needed
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white, // Apply white color to the text
          ),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage() ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        cartItems[index]['image'],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        cartItems[index]['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            cartItems[index]['price'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Quantity: ${cartItems[index]['quantity']}',
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  // Decrease quantity logic here
                                },
                                icon: Icon(Icons.remove_circle_outline),
                                color: Colors.purple,
                              ),
                              IconButton(
                                onPressed: () {
                                  // Increase quantity logic here
                                },
                                icon: Icon(Icons.add_circle_outline),
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.redAccent,
                        onPressed: () {
                          // Remove item from cart logic
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rs 4700',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Checkout logic here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //
      //   selectedItemColor: Colors.black, // Color of the selected item
      //   unselectedItemColor: Colors.purple, // Color of the unselected items
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.receipt),
      //       label: 'Order',
      //
      //     ),
      //
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }

  void setState(Null Function() param0) {}
}