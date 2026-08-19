import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


import '../core/app_state.dart';
import 'dashboard_screen.dart';
class LocationSetupScreen extends StatefulWidget {
  const LocationSetupScreen({super.key});

  @override
  State<LocationSetupScreen> createState() =>
      _LocationSetupScreenState();
}

class _LocationSetupScreenState
    extends State<LocationSetupScreen> {

  final TextEditingController locationController =
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

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled =
        await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return;
    }

   permission =
    await Geolocator.checkPermission();

if (permission == LocationPermission.denied) {
  permission =
      await Geolocator.requestPermission();
}

if (permission == LocationPermission.denied ||
    permission == LocationPermission.deniedForever) {
  return;
}

    Position position =
        await Geolocator.getCurrentPosition();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemarks.first;

    setState(() {
      locationController.text =
    "${place.locality}, ${place.administrativeArea}, ${place.country}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8F5E9),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  LinearProgressIndicator(
                    value: 1.0,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 25),

                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 55,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    getText(
                      "Choose Your Location",
                      "നിങ്ങളുടെ സ്ഥലം തിരഞ്ഞെടുക്കുക",
                      "अपना स्थान चुनें",
                      "உங்கள் இருப்பிடத்தைத் தேர்ந்தெடுக்கவும்",
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    getText(
                      "Weather, market prices and AI recommendations need your location.",
                      "കാലാവസ്ഥ, മാർക്കറ്റ് വില, AI ശുപാർശകൾക്കായി നിങ്ങളുടെ സ്ഥലം ആവശ്യമാണ്.",
                      "मौसम, बाजार मूल्य और AI सिफारिशों के लिए आपका स्थान आवश्यक है।",
                      "வானிலை, சந்தை விலை மற்றும் AI பரிந்துரைகளுக்கு உங்கள் இருப்பிடம் தேவை.",
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.all(20),
                      child: Column(
                        children: [

                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton.icon(
                              onPressed: getCurrentLocation,
                              icon: const Icon(
                                Icons.my_location,
                              ),
                              label: Text(
                                getText(
                                  "Use GPS Location",
                                  "GPS സ്ഥലം ഉപയോഗിക്കുക",
                                  "GPS स्थान उपयोग करें",
                                  "GPS இருப்பிடத்தைப் பயன்படுத்தவும்",
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Voice Location Later
                              },
                              icon: const Icon(Icons.mic),
                              label: Text(
                                getText(
                                  "Speak Location",
                                  "സ്ഥലം പറയുക",
                                  "स्थान बोलें",
                                  "இருப்பிடத்தை கூறுங்கள்",
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          TextField(
                            controller:
                                locationController,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(
                                      Icons.location_city),

                              suffixIcon: IconButton(
                                icon:
                                    const Icon(Icons.mic),
                                onPressed: () {
                                  // Voice Input Later
                                },
                              ),

                              labelText: getText(
                                "Enter Location",
                                "സ്ഥലം നൽകുക",
                                "स्थान दर्ज करें",
                                "இருப்பிடத்தை உள்ளிடவும்",
                              ),

                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        12),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton.icon(
                              onPressed: () {

  if (locationController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          getText(
            "Please enter location",
            "ദയവായി സ്ഥലം നൽകുക",
            "कृपया स्थान दर्ज करें",
            "இருப்பிடத்தை உள்ளிடவும்",
          ),
        ),
      ),
    );
    return;
  }

  AppState.userLocation =
      locationController.text.trim();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const DashboardScreen(),
    ),
  );
},
                              icon:
                                  const Icon(Icons.check),
                              label: Text(
                                getText(
                                  "Finish Setup",
                                  "സജ്ജീകരണം പൂർത്തിയാക്കുക",
                                  "सेटअप पूरा करें",
                                  "அமைப்பை முடிக்கவும்",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}