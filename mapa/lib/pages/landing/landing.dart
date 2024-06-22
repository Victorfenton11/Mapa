import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapa/pages/login/login.dart';
import 'package:mapa/pages/register/register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/earth.svg',
              height: 150,
              /* fit: BoxFit.cover, */
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 150), // Add this to offset the height of the image
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Mapa',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff91D670)),
                    ),
                    Text(
                      'Adventure awaits you! Get started and turn your travel dreams into reality',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(const Color(0xffF3F3F3)),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                  onPressed: () {
                    // Handle login action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Login',
                      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 30)),
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(const Color(0xffF3F3F3)),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                  onPressed: () {
                    // Handle register action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: const Text('Register',
                      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 30)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
