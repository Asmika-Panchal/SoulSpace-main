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
    // var screenHeight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width;
    var isDarkMode = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text("Profile"),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff661080), Color(0xff2B0437)])),
        child: Column(
          children: [
            // Profile Picture and Info
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  // Profile Picture
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(
                          'assets/profile.png'), // Replace with your image
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Profile Name
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Gold Member Status
                  isGoldMember
                      ? const Text(
                          "⚡ Gold Member",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const Text(
                          "Upgrade to Gold?",
                          style: TextStyle(color: Colors.white70),
                        ),
                ],
              ),
            ),

            // Contact Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      const SizedBox(height: 5),
                      const Text(
                        "+91 1234567890",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
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
                      const SizedBox(height: 5),
                      const Text(
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

            const SizedBox(height: 30),

            // Settings List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    trailing: const Icon(CupertinoIcons.chevron_right),
                  ),
                  buildSettingItem(
                    icon: Icons.person_outline,
                    title: "Profile Details",
                    trailing: const Icon(CupertinoIcons.chevron_right),
                  ),
                  buildSettingItem(
                    icon: Icons.settings,
                    title: "Settings & Reminders",
                    trailing: const Icon(CupertinoIcons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
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