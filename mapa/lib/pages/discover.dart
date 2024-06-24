import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<Map<String, String>> images = [
    {'image': 'assets/image1.jpg', 'label': 'image1'},
    {'image': 'assets/image2.jpg', 'label': 'image2'},
    {'image': 'assets/image3.jpg', 'label': 'image3'},
    {'image': 'assets/image4.jpg', 'label': 'image4'},
    {'image': 'assets/image5.jpg', 'label': 'image5'},
    {'image': 'assets/image6.jpg', 'label': 'image6'},
    {'image': 'assets/image7.jpg', 'label': 'image7'},
    {'image': 'assets/image8.jpg', 'label': 'image8'},
    {'image': 'assets/image9.jpg', 'label': 'image9'},
    {'image': 'assets/image10.jpg', 'label': 'image10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 70.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Row(
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
            const SizedBox(height: 5),
            // Scrollable gallery of images here
            Expanded(
              child: StaggeredGridView.countBuilder(
                // TODO: why when we add padding bottom navbar is surpassed?
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                crossAxisCount: 2,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildImageCard(
                  image: images[index]['image']!,
                  label: images[index]['label']!,
                ),
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
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

  Widget _buildImageCard({
    required String image,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: Random().nextInt(126) + 150,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
