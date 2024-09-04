import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the homepage
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Example Order Card
          OrderCard(
            orderId: '123456789',
            orderDate: '12 Aug 2024',
            orderStatus: 'Confirmed',
            currentLocation: 'Mumbai',
            deliveryDate: '18 Aug 2024',
          ),
          SizedBox(height: 16.0),
          OrderCard(
            orderId: '987654321',
            orderDate: '10 Aug 2024',
            orderStatus: 'Shipped',
            currentLocation: 'Delhi',
            deliveryDate: '17 Aug 2024',
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderId;
  final String orderDate;
  final String orderStatus;
  final String currentLocation;
  final String deliveryDate;

  const OrderCard({
    required this.orderId,
    required this.orderDate,
    required this.orderStatus,
    required this.currentLocation,
    required this.deliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: $orderId',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Order Date: $orderDate', style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 8.0),
            OrderStatusWidget(orderStatus: orderStatus),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Location:', style: TextStyle(color: Colors.grey[600])),
                    Text(
                      currentLocation,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery Date:', style: TextStyle(color: Colors.grey[600])),
                    Text(
                      deliveryDate,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                  ),
                  child: Text(
                    'Track Order',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white, // Explicit and simple text style
                      // Avoid using inherited or complex merged TextStyles
                    ),
                  ),
                )

            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  final String orderStatus;

  const OrderStatusWidget({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (orderStatus.toLowerCase()) {
      case 'confirmed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        statusText = 'Order Confirmed';
        break;
      case 'shipped':
        statusColor = Colors.orange;
        statusIcon = Icons.local_shipping;
        statusText = 'Order Shipped';
        break;
      case 'out for delivery':
        statusColor = Colors.blue;
        statusIcon = Icons.delivery_dining;
        statusText = 'Out for Delivery';
        break;
      case 'delivered':
        statusColor = Colors.purple;
        statusIcon = Icons.home;
        statusText = 'Delivered';
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.info;
        statusText = 'Status Unknown';
    }

    return Row(
      children: [
        Icon(statusIcon, color: statusColor, size: 24.0),
        SizedBox(width: 8.0),
        Text(
          statusText,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}