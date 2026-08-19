import 'package:flutter/material.dart';
import '../core/app_state.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

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
            "Market Prices",
            "മാർക്കറ്റ് വിലകൾ",
            "बाज़ार मूल्य",
            "சந்தை விலைகள்",
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Location Card
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                title: Text(
                  AppState.userLocation.isEmpty
                      ? "Location Not Set"
                      : AppState.userLocation,
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Search Box
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                labelText: getText(
                  "Search Crop",
                  "വിള തിരയുക",
                  "फसल खोजें",
                  "பயிரைத் தேடுங்கள்",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// Categories
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text("All")),
                Chip(label: Text("Vegetables")),
                Chip(label: Text("Fruits")),
                Chip(label: Text("Grains")),
                Chip(label: Text("Spices")),
              ],
            ),

            const SizedBox(height: 20),

            /// Market Cards
            marketCard(
              "Rice",
              "₹42 / Kg",
              "+2.5%",
              true,
            ),

            marketCard(
              "Tomato",
              "₹35 / Kg",
              "-1.2%",
              false,
            ),

            marketCard(
              "Potato",
              "₹28 / Kg",
              "+0.8%",
              true,
            ),

            marketCard(
              "Onion",
              "₹40 / Kg",
              "+3.1%",
              true,
            ),

            marketCard(
              "Banana",
              "₹55 / Dozen",
              "-0.5%",
              false,
            ),
          ],
        ),
      ),
    );
  }

  static Widget marketCard(
    String crop,
    String price,
    String change,
    bool isUp,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(
          Icons.agriculture,
          color: Colors.green,
        ),
        title: Text(crop),
        subtitle: Text(price),
        trailing: Text(
          change,
          style: TextStyle(
            color: isUp ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}