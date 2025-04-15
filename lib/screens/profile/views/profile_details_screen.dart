import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/Profile_example.png"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Geovanny Basantes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "ggeta13basantes@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildProfileDetailRow("Name", "Geovanny"),
            _buildProfileDetailRow("Date of birth", "Oct 31, 1997"),
            _buildProfileDetailRow("Phone number", "+1–202–555–0162"),
            _buildProfileDetailRow("Gender", "Male"),
            _buildProfileDetailRow("Email", "ggeta13basantes@gmail.com"),
            _buildProfileDetailRow("Password", "Change Password", isLink: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetailRow(String title, String value, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          GestureDetector(
            onTap: isLink ? () {} : null, // Add functionality for links
            child: Text(
              value,
              style: TextStyle(
                color: isLink ? Colors.blue : Colors.black,
                fontWeight: isLink ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
