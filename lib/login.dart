import 'package:flutter/material.dart';
import 'package:island_way/screens/map_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart'; 

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<dynamic> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on Exception catch (e) {
    // TODO
    print('exception->$e');
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: buildButton(
                      icon: Icons.person,
                      text: 'Continue Anonymously',
                      buttonColor: Color.fromARGB(110, 0, 0, 0),
                      textColor: Colors.white,
                      onTap: () {
                        // Navigate to the MapView page here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapView()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'or',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: buildButton(
                      icon: Icons.email,
                      text: 'Continue with Google',
                      buttonColor: Colors.white,
                      textColor: Color.fromARGB(255, 7, 44, 32),
                      onTap: () async {
                        User? user = await signInWithGoogle();
                        if (user != null) {
                          // Handle navigation or any other action after sign-in
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapView()),
                          );
                        } else {
                          // Handle sign-in failure
                          // For example, display an error message
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton({
    required IconData icon,
    required String text,
    required Color buttonColor,
    required Color textColor,
    required Function() onTap, // Change this to accept a function
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: textColor),
        label: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 18.0, // Adjust the font size here
          ),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}
