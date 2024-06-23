import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
    'assets/image7.jpg',
    'assets/image8.jpg',
    'assets/image9.jpg',
    'assets/image10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 20, right: 20), // Adjust this value as needed
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Chicago, IL",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff826251),
                      ),
                    ),
                    Icon(
                      Icons.pin_drop_rounded,
                      color: Color(0xff826251),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFeatureBox(
                  color: const Color(0xffA3D8FF),
                  icon: 'assets/diamond.svg',
                ),
                _buildFeatureBox(
                  color: const Color(0xffE9D9BF),
                  icon: 'assets/compass.svg',
                ),
                _buildFeatureBox(
                  color: const Color(0xff91D670),
                  icon: 'assets/discount.svg',
                ),
                _buildFeatureBox(
                  color: const Color(0xffE0E0E9),
                  icon: 'assets/binoculars.svg',
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFeatureText(label: "Hidden Gems"),
                _buildFeatureText(label: "Places Nearby"),
                _buildFeatureText(label: "Deals"),
                _buildFeatureText(label: "Lookout Spots"),
              ],
            ),

            const SizedBox(height: 20),

            const Row(
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            // Scrollable gallery of images here


          ],
        ),
      ),
    );
  }

  Widget _buildFeatureBox({
    required Color color,
    required String icon,
  }) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 50,
            height: 50,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
  Widget _buildFeatureText({
    required String label,
  }) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
