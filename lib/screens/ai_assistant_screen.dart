import 'package:flutter/material.dart';
import '../core/app_state.dart';

class AIAssistantScreen extends StatefulWidget {
  const AIAssistantScreen({super.key});

  @override
  State<AIAssistantScreen> createState() =>
      _AIAssistantScreenState();
}

class _AIAssistantScreenState
    extends State<AIAssistantScreen> {

  final TextEditingController questionController =
      TextEditingController();

  String aiResponse =
      "Hello! How can I help you today?";

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

  void askAI() {
    if (questionController.text.trim().isEmpty) {
      return;
    }

    setState(() {
      aiResponse =
          "You asked:\n\n${questionController.text}\n\nAI response will appear here after backend integration.";
    });

    questionController.clear();
  }

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF5),

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          getText(
            "AI Assistant",
            "AI സഹായി",
            "AI सहायक",
            "AI உதவியாளர்",
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [

            Card(
              color: Colors.green.shade50,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  aiResponse,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: questionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: getText(
                  "Ask your question...",
                  "ചോദ്യം ചോദിക്കൂ...",
                  "अपना प्रश्न पूछें...",
                  "உங்கள் கேள்வியை கேளுங்கள்...",
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: askAI,
              icon: const Icon(Icons.send),
              label: Text(
                getText(
                  "Ask AI",
                  "AIയോട് ചോദിക്കൂ",
                  "AI से पूछें",
                  "AIயிடம் கேளுங்கள்",
                ),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Voice Assistant will be connected later.",
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.mic),
              label: Text(
                getText(
                  "Start Speaking",
                  "സംസാരം ആരംഭിക്കുക",
                  "बोलना शुरू करें",
                  "பேசத் தொடங்குங்கள்",
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.lightbulb,
                  color: Colors.green,
                ),
                title: Text(
                  getText(
                    "Suggested Questions",
                    "നിർദേശിച്ച ചോദ്യങ്ങൾ",
                    "सुझाए गए प्रश्न",
                    "பரிந்துரைக்கப்பட்ட கேள்விகள்",
                  ),
                ),
                subtitle: Text(
                  getText(
                    "• Will it rain tomorrow?\n• Best fertilizer for banana?\n• Current rice market price?",
                    "• നാളെ മഴ പെയ്യുമോ?\n• വാഴയ്ക്ക് മികച്ച വളം?\n• ഇന്നത്തെ നെല്ല് വിപണി വില?",
                    "• क्या कल बारिश होगी?\n• केले के लिए सर्वोत्तम उर्वरक?\n• आज चावल का बाजार मूल्य?",
                    "• நாளை மழை பெய்யுமா?\n• வாழைக்கு சிறந்த உரம்?\n• இன்றைய அரிசி சந்தை விலை?",
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