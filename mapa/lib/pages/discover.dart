import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<Map<String, String>> images = [
    {'image': 'assets/image1.jpg', 'label': 'image 1'},
    {'image': 'assets/image2.jpg', 'label': 'image 2'},
    {'image': 'assets/image3.jpg', 'label': 'image 3'},
    {'image': 'assets/image4.jpg', 'label': 'image 4'},
    {'image': 'assets/image5.jpg', 'label': 'image 5'},
    {'image': 'assets/image6.jpg', 'label': 'image 6'},
    {'image': 'assets/image7.jpg', 'label': 'image 7'},
    {'image': 'assets/image8.jpg', 'label': 'image 8'},
    {'image': 'assets/image9.jpg', 'label': 'image 9'},
    {'image': 'assets/image10.jpg', 'label': 'image 10'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 20, right: 20),
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
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: _buildImageCard(
                      image: images[index]['image']!,
                      label: images[index]['label']!,
                    ),
                  );
                },
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
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.transparent,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
