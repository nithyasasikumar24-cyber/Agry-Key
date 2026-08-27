import 'package:flutter/material.dart';
import 'otp_screen.dart';
import '../core/app_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      backgroundColor: const Color(0xFFF5FAF5),

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          getText(
            "Login",
            "ലോഗിൻ",
            "लॉगिन",
            "உள்நுழைவு",
          ),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.phone_android,
              size: 80,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            Text(
              getText(
                "Welcome to AGRI KEY",
                "AGRI KEY ലേക്ക് സ്വാഗതം",
                "AGRI KEY में आपका स्वागत है",
                "AGRI KEY-க்கு வரவேற்கிறோம்",
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
                "Login using your mobile number",
                "മൊബൈൽ നമ്പർ ഉപയോഗിച്ച് ലോഗിൻ ചെയ്യുക",
                "मोबाइल नंबर का उपयोग करके लॉगिन करें",
                "மொபைல் எண்ணைப் பயன்படுத்தி உள்நுழைக",
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            TextField(
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    "+91",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                labelText: getText(
                  "Mobile Number",
                  "മൊബൈൽ നമ്പർ",
                  "मोबाइल नंबर",
                  "மொபைல் எண்",
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OtpScreen(),
                    ),
                  );
                },

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send),

                    const SizedBox(width: 8),

                    Text(
                      getText(
                        "Send OTP",
                        "OTP അയയ്ക്കുക",
                        "OTP भेजें",
                        "OTP அனுப்பு",
                      ),
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