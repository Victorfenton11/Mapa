import 'dart:ffi';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:mapa/constants.dart' as constants;
import 'package:mapa/pages/postscreens/post.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, String>> imageProfiles = [
    {'image': 'assets/image1.jpg'},
    {'image': 'assets/image2.jpg'},
    {'image': 'assets/image3.jpg'},
    {'image': 'assets/image4.jpg'},
    {'image': 'assets/image5.jpg'},
    {'image': 'assets/image6.jpg'},
    {'image': 'assets/image7.jpg'},
    {'image': 'assets/image8.jpg'},
    {'image': 'assets/image9.jpg'},
    {'image': 'assets/image10.jpg'},
  ];

  int _followersCount = 213;
  int _followingCount = 245;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 60.0, left: 20, right: 20, bottom: 70.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/image1.jpg'),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Brandon James',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                CountryFlag.fromCountryCode(
                                  'TR',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.home, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  'Cappadocia, Turkey',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '$_followersCount',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Text(
                                      '$_followingCount',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "My Badges",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: imageProfiles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: _buildStoryCircle(
                          profileImage: imageProfiles[index]['image']!,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 95,
            left: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const PostScreen()),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 24.0,
              ),
              backgroundColor: Color(constants.GREEN),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCircle({required String profileImage}) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(constants.GREEN), Color(constants.LIGHT_BLUE)],
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
      ],
    );
  }
}
