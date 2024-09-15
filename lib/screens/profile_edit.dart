import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  // Date of Birth controller
  TextEditingController dobController = TextEditingController();
  DateTime selectedDate = DateTime(2000, 1, 1); // Default date of birth

  // Function to show Cupertino Date Picker
  void _selectDate(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            initialDateTime: selectedDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                selectedDate = newDate;
                dobController.text =
                    "${newDate.day}/${newDate.month}/${newDate.year}";
              });
            },
            maximumDate: DateTime.now(),
            minimumYear: 1900,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Set the initial value of the date controller
    dobController.text =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff661080), Color(0xff2B0437)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Profile Picture
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile.png'), // Replace with your asset
                      ),
                      const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.white),
                        label: const Text(
                          'Change Picture',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Full Name Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: TextEditingController(text: 'John Doe'),
                ),
                const SizedBox(height: 20),
                // Phone Number Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: TextEditingController(text: '+14987889999'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                // Email Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email id',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: TextEditingController(text: 'john.doe@mail.com'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                // Date of Birth Field with Cupertino Date Picker
                TextField(
                  readOnly:
                      true, // Make it read-only so that users can't directly edit
                  decoration: InputDecoration(
                    labelText: 'Date of birth',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    suffixIcon:
                        const Icon(Icons.calendar_today, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: dobController,
                  onTap: () =>
                      _selectDate(context), // Show the Cupertino Date Picker
                ),
                const SizedBox(height: 20),
                // City Field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  controller: TextEditingController(text: 'New York'),
                ),
                const SizedBox(height: 30),
                // Update Button
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Color(0xff030103)),
                  ),
                ),
                const SizedBox(height: 10),
                // Change Password Button
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
                  ),
                  child: const Text(
                    'Change Password?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
