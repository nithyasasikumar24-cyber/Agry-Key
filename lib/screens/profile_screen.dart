import 'package:flutter/material.dart';
import '../core/app_state.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  String getText(
    String english,
    String malayalam,
    String hindi,
    String tamil,
  ) {
    switch (AppState.selectedLanguage) {
      case "Malayalam":
        return malayalam;
      case "Hindi":
        return hindi;
      case "Tamil":
        return tamil;
      default:
        return english;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          getText(
            "Profile",
            "പ്രൊഫൈൽ",
            "प्रोफ़ाइल",
            "சுயவிவரம்",
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              AppState.userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.work),
                title: Text(AppState.userOccupation),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(AppState.userLocation),
              ),
            ),
            Card(
  child: ListTile(
    leading: const Icon(Icons.agriculture),
    title: Text(
      AppState.farmName.isEmpty
          ? "Farm Name Not Set"
          : AppState.farmName,
    ),
  ),
),

Card(
  child: ListTile(
    leading: const Icon(Icons.grass),
    title: Text(
      AppState.userCrop.isEmpty
          ? "Crop Not Set"
          : AppState.userCrop,
    ),
  ),
),

            Card(
              child: ListTile(
                leading: const Icon(Icons.language),
                title: Text(AppState.selectedLanguage),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
             onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const EditProfileScreen(),
    ),
  );
},
              icon: const Icon(Icons.edit),
              label: Text(
                getText(
                  "Edit Profile",
                  "പ്രൊഫൈൽ തിരുത്തുക",
                  "प्रोफ़ाइल संपादित करें",
                  "சுயவிவரத்தை திருத்து",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}