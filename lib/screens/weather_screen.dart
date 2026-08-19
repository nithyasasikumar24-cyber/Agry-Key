import 'package:flutter/material.dart';
import '../core/app_state.dart';
import '../services/weather_service.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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

  Widget weatherCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          getText(
            "Weather",
            "കാലാവസ്ഥ",
            "मौसम",
            "வானிலை",
          ),
        ),
      ),
      body: SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [

      Card(
        color: Colors.green.shade50,
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

     weatherCard(
  Icons.thermostat,
  "Temperature",
  WeatherService.temperature,
),

     weatherCard(
  Icons.water_drop,
  "Humidity",
  WeatherService.humidity,
),

     weatherCard(
  Icons.air,
  "Wind Speed",
  WeatherService.windSpeed,
),

     weatherCard(
  Icons.cloud,
  "Rain Chance",
  WeatherService.rainChance,
),

      const SizedBox(height: 20),

      const Text(
        "5-Day Forecast",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 10),

      Card(
        child: ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text("Tomorrow"),
          trailing: Text("29°C"),
        ),
      ),

            Card(
        child: ListTile(
          leading: Icon(Icons.cloud),
          title: Text("Day 2"),
          trailing: Text("27°C"),
        ),
      ),
    ],
  ),
),
);
  }
}