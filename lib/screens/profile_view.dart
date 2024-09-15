import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul/screens/mood1.dart';
import 'package:soul/screens/profile_edit.dart';
import 'package:soul/screens/question.dart';
import 'package:soul/screens/reminder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isGoldMember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text("Profile"),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            // Navigator.pop(context);
          },
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
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const Hero(
                    tag: "my-hero-animation-tag",
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Mood1Screen(),
                        ),
                      );
                    },
                    child: buildSettingItem(
                      icon: Icons.person_outline,
                      title: "😊Mood Entry😰",
                      trailing: const Icon(CupertinoIcons.gauge),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Questions(),
                        ),
                      );
                    },
                    child: buildSettingItem(
                      icon: CupertinoIcons.question_circle,
                      title: "Questionaire",
                      trailing: const Icon(CupertinoIcons.chevron_right),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                    child: buildSettingItem(
                      icon: Icons.person_outline,
                      title: "Profile Edit",
                      trailing: const Icon(CupertinoIcons.chevron_right),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReminderScreen(),
                        ),
                      );
                    },
                    child: buildSettingItem(
                      icon: Icons.settings,
                      title: "Settings & Reminders",
                      trailing: const Icon(CupertinoIcons.chevron_right),
                    ),
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
