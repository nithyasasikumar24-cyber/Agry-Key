import 'package:flutter/material.dart';
import '../core/app_state.dart';

class DiseaseDetectionScreen extends StatelessWidget {
  const DiseaseDetectionScreen({super.key});

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
            "Disease Detection",
            "രോഗ നിർണയം",
            "रोग पहचान",
            "நோய் கண்டறிதல்",
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 80,
                  color: Colors.green,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                label: Text(
                  getText(
                    "Take Photo",
                    "ഫോട്ടോ എടുക്കുക",
                    "फोटो लें",
                    "புகைப்படம் எடுக்கவும்",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.upload),
                label: Text(
                  getText(
                    "Upload Image",
                    "ചിത്രം അപ്‌ലോഡ് ചെയ്യുക",
                    "छवि अपलोड करें",
                    "படத்தை பதிவேற்றவும்",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.green.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Detected Disease",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Leaf Spot"),
                    SizedBox(height: 10),
                    Text("Confidence: 94%"),
                    SizedBox(height: 10),
                    Text(
                      "Recommended Action: Apply fungicide and monitor crop health.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}