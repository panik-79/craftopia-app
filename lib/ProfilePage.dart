import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Logout function
  Future<void> _logout(BuildContext context) async {
    try {
      await _auth.signOut();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Logged out successfully!'),
        backgroundColor: Colors.green,
      ));

      // Navigate to login or splash screen after logout
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      ); // Adjust the route as needed
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to log out. Please try again.'),
        backgroundColor: Colors.red,
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profile Header
          _buildProfileHeader(),
          SizedBox(height: 20.0),

          // Profile Options
          _buildProfileOption(
            icon: Icons.shopping_bag,
            title: 'My Orders',
            onTap: () {
              // Navigate to the orders page
            },
          ),
          _buildProfileOption(
            icon: Icons.location_on,
            title: 'My Addresses',
            onTap: () {
              // Navigate to the addresses page
            },
          ),
          _buildProfileOption(
            icon: Icons.payment,
            title: 'Payment Methods',
            onTap: () {
              // Navigate to the payment methods page
            },
          ),
          _buildProfileOption(
            icon: Icons.person,
            title: 'Account Settings',
            onTap: () {
              // Navigate to the account settings page
            },
          ),
          _buildProfileOption(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Navigate to the notifications settings page
            },
          ),
          _buildProfileOption(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {
              // Navigate to the help and support page
            },
          ),
          _buildProfileOption(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40.0
          // backgroundImage: AssetImage('assets/profilepic.jpg'),
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Mohammed',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text(
              'mohammed@example.com',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Edit Profile', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(title, style: TextStyle(fontSize: 16.0)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}