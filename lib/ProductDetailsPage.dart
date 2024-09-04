import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'HomePage.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName = "Sunset Painting For Wall";
  final List<String> imageUrls = [
    'https://m.media-amazon.com/images/I/713jNeMYLFL.AC_UF1000,1000_QL80.jpg',
    'https://m.media-amazon.com/images/I/61CJvltxGiL.AC_UF350,350_QL80.jpg',
  ];
  final String description =
      "These stylish sunglasses are perfect for any occasion. Protect your eyes from the sun while looking cool and fashionable.";
  final double price = 129.99;
  final double rating = 4.5;
  final String enterpriseName = "Cool Shades Inc.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            ); // Go back to previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PageView for manual sliding
            Container(
              height: 300, // Adjust height as needed
              child: PageView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                productName,
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '\$$price', // Assuming the price is in dollars; adjust if needed
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 4),
                  Text('$rating/5', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                height: 60, // Adjusted height
                width: 310, // Adjusted width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.deepOrange,
                ),
                padding:
                EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                  ),
                  dropdownColor: Colors.deepOrange,
                  value: null,
                  hint: Text(
                    'Select Customization',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  items: <String>['Option 1', 'Option 2', 'Option 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Navigate to the chat screen when a customization is selected
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Enterprise: $enterpriseName',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Description',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(description, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}