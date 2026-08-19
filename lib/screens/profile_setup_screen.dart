import 'package:flutter/material.dart';
import '../core/app_state.dart';
import 'location_setup_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() =>
      _ProfileSetupScreenState();
}

class _ProfileSetupScreenState
    extends State<ProfileSetupScreen> {
      final TextEditingController nameController =
    TextEditingController();

final TextEditingController farmController =
    TextEditingController();

final TextEditingController cropController =
    TextEditingController();
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
        title: Text(
          getText(
            "Profile Setup",
            "പ്രൊഫൈൽ സജ്ജീകരണം",
            "प्रोफ़ाइल सेटअप",
            "சுயவிவர அமைப்பு",
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.green.shade100,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              getText(
                "Complete Your Profile",
                "നിങ്ങളുടെ പ്രൊഫൈൽ പൂർത്തിയാക്കുക",
                "अपनी प्रोफ़ाइल पूरी करें",
                "உங்கள் சுயவிவரத்தை பூர்த்தி செய்யவும்",
              ),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Text(
              getText(
                "Help us personalize your experience",
                "നിങ്ങളുടെ അനുഭവം വ്യക്തിഗതമാക്കാൻ സഹായിക്കൂ",
                "आपके अनुभव को बेहतर बनाने में हमारी सहायता करें",
                "உங்கள் அனுபவத்தை தனிப்பயனாக்க உதவுங்கள்",
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

           TextField(
  controller: nameController,

  decoration: InputDecoration(
    prefixIcon: const Icon(Icons.person),

    suffixIcon: IconButton(
      icon: const Icon(Icons.mic),
      onPressed: () {
        // Voice Input Later
      },
    ),

    labelText: getText(
      "Full Name",
      "പൂർണ്ണ പേര്",
      "पूरा नाम",
      "முழு பெயர்",
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),

            const SizedBox(height: 20),

            TextField(
              controller: farmController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.agriculture),
                suffixIcon: IconButton(
  icon: const Icon(Icons.mic),
  onPressed: () {},
),
                labelText: getText(
                  "Farm Name (Optional)",
                  "ഫാമിന്റെ പേര് (നിർബന്ധം ഇല്ല)",
                  "खेत का नाम (वैकल्पिक)",
                  "பண்ணை பெயர் (விருப்பம்)",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: cropController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.grass),
                suffixIcon: IconButton(
  icon: const Icon(Icons.mic),
  onPressed: () {},
),
                labelText: getText(
                  "Main Crop (Optional)",
                  "പ്രധാന വിള (നിർബന്ധം ഇല്ല)",
                  "मुख्य फसल (वैकल्पिक)",
                  "முக்கிய பயிர் (விருப்பம்)",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

DropdownButtonFormField<String>(
  value: null,
  decoration: InputDecoration(
    prefixIcon: const Icon(Icons.work),
    labelText: getText(
  "Occupation",
  "തൊഴിൽ",
  "व्यवसाय",
  "தொழில்",
),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  items: [
  DropdownMenuItem(
    value: "Farmer",
    child: Text(
      getText(
        "Farmer",
        "കർഷകൻ",
        "किसान",
        "விவசாயி",
      ),
    ),
  ),

  DropdownMenuItem(
    value: "Buyer",
    child: Text(
      getText(
        "Buyer",
        "വാങ്ങുന്നയാൾ",
        "खरीदार",
        "வாங்குபவர்",
      ),
    ),
  ),

  DropdownMenuItem(
    value: "Agriculture Expert",
    child: Text(
      getText(
        "Agriculture Expert",
        "കാർഷിക വിദഗ്ധൻ",
        "कृषि विशेषज्ञ",
        "விவசாய நிபுணர்",
      ),
    ),
  ),

  DropdownMenuItem(
    value: "Student",
    child: Text(
      getText(
        "Student",
        "വിദ്യാർത്ഥി",
        "छात्र",
        "மாணவர்",
      ),
    ),
  ),
],
  onChanged: (value) {
    AppState.userOccupation = value ?? "";
  },
),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {
                  AppState.userName = nameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LocationSetupScreen(),
                    ),
                  );
                },

                child: Text(
                  getText(
                    "Continue",
                    "തുടരുക",
                    "जारी रखें",
                    "தொடரவும்",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}