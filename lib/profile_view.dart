import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isGoldMember = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    var isDarkMode = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text("Profile"),
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff661080), Color(0xff2B0437)])),
        child: Column(
          children: [
            // Profile Picture and Info
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(
                          'assets/profile.png'), // Replace with your image
                    ),
                  ),
                  SizedBox(height: 15),
                  // Profile Name
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Gold Member Status
                  isGoldMember
                      ? Text(
                          "⚡ Gold Member",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Text(
                          "Upgrade to Gold?",
                          style: TextStyle(color: Colors.white70),
                        ),
                ],
              ),
            ),

            // Contact Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "+91 1234567890",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mail",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Johndoe@mail.com",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Settings List
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                children: [
                  buildSettingItem(
                    icon: Icons.nights_stay,
                    title: "Dark Mode",
                    trailing: CupertinoSwitch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                      activeColor: Colors.purple,
                    ),
                  ),
                  buildSettingItem(
                    icon: Icons.credit_card,
                    title: "Cards",
                    trailing: Icon(CupertinoIcons.chevron_right),
                  ),
                  buildSettingItem(
                    icon: Icons.person_outline,
                    title: "Profile Details",
                    trailing: Icon(CupertinoIcons.chevron_right),
                  ),
                  buildSettingItem(
                    icon: Icons.settings,
                    title: "Settings & Reminders",
                    trailing: Icon(CupertinoIcons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
      IconData icon, bool isActive, String label, BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,
            color: isActive ? Colors.purpleAccent : Color(0xff6F2685),
            size: screenHeight * 0.04),
        SizedBox(height: screenHeight * 0.005),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.015),
        ),
      ],
    );
  }

  Widget buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
