import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final List<Map<String, String>> imageProfiles = [
    {'image': 'assets/image1.jpg', 'username': 'johndoe'},
    {'image': 'assets/image2.jpg', 'username': 'janedoe'},
    {'image': 'assets/image3.jpg', 'username': 'johnsmith'},
    {'image': 'assets/image4.jpg', 'username': 'janesmith'},
    {'image': 'assets/image5.jpg', 'username': 'johnsmith'},
    {'image': 'assets/image6.jpg', 'username': 'janesmith'},
    {'image': 'assets/image7.jpg', 'username': 'johnsmith'},
    {'image': 'assets/image8.jpg', 'username': 'janesmith'},
    {'image': 'assets/image9.jpg', 'username': 'johnsmith'},
    {'image': 'assets/image10.jpg', 'username': 'janesmith'},
  ];

  final List<Map<String, String>> posts = [
    {
      'image': 'assets/image1.jpg',
      'profileImage': 'assets/profile1.jpg',
      'name': 'John Doe',
      'username': '@johndoe',
      'location': 'Chicago, IL',
    },
    {
      'image': 'assets/image2.jpg',
      'profileImage': 'assets/profile2.jpg',
      'name': 'Jane Doe',
      'username': '@janedoe',
      'location': 'Chicago, IL',
    },
    {
      'image': 'assets/image3.jpg',
      'profileImage': 'assets/profile3.jpg',
      'name': 'John Smith',
      'username': '@johnsmith',
      'location': 'Chicago, IL',
    },
    {
      'image': 'assets/image4.jpg',
      'profileImage': 'assets/profile4.jpg',
      'name': 'Jane Smith',
      'username': '@janesmith',
      'location': 'Chicago, IL',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 70.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mapa",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageProfiles.length,
                itemBuilder: (context, index) {
                  final profile = imageProfiles[index];
                  final profileImage = profile['image'] ?? 'assets/default.jpg';
                  final username = profile['username'] ?? 'unknown';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _buildStoryCircle(
                      profileImage: profileImage,
                      username: username,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            ToggleSwitch(
              inactiveBgColor: const Color.fromARGB(255, 227, 227, 227),
              minWidth: 120.0,
              cornerRadius: 20.0,
              inactiveFgColor: Colors.white,
              activeBgColor: const [Colors.white],
              initialLabelIndex: 0,
              doubleTapDisable: true, // re-tap active widget to de-activate
              totalSwitches: 3,
              labels: const ['Friends', 'Travelers', 'My Area'],
              customTextStyles: const [
                TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            const SizedBox(height: 15),
            // Add sizedbox here
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: _postCard(
                      image: post['image']!,
                      profileImage: post['profileImage']!,
                      name: post['name']!,
                      username: post['username']!,
                      location: post['location']!,
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

  Widget _buildStoryCircle({
    required String profileImage,
    required String username,
  }) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.lightBlue.shade200, Colors.lightBlue.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0), // Border width
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5), // Spacing between image and text
        Text(
          username,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _postCard({
    required String image,
    required String profileImage,
    required String name,
    required String username,
    required String location,
  }) {
    return Container(
      height: 350, // Adjusted height to fit the image and text overlays
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        username,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
