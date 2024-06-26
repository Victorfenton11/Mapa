import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:mapa/constants.dart' as constants;

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final List<Map<String, dynamic>> users = [
    {
      'username': 'johndoe',
      'images': ['assets/image1.jpg', 'assets/image2.jpg'],
    },
    {
      'username': 'janedoe',
      'images': ['assets/image3.jpg', 'assets/image4.jpg'],
    },
    {
      'username': 'johnsmith',
      'images': ['assets/image5.jpg', 'assets/image6.jpg'],
    },
    {
      'username': 'janesmith',
      'images': ['assets/image7.jpg', 'assets/image8.jpg'],
    },
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

  int _selectedIndex = 0;

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
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Mapa",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final profileImage = user['images'][0];
                  final username = user['username'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _showImagePopup(users, index, 0);
                      },
                      child: _buildStoryCircle(
                        profileImage: profileImage,
                        username: username,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(constants.GREY),
                      spreadRadius: 0.5,
                      blurRadius: 1.0,
                    )
                  ]),
              child: ToggleSwitch(
                inactiveBgColor: const Color.fromARGB(255, 227, 227, 227),
                minWidth: 120.0,
                cornerRadius: 20.0,
                inactiveFgColor: Colors.white,
                activeBgColor: const [Colors.white],
                initialLabelIndex: _selectedIndex,
                doubleTapDisable: false, // re-tap active widget to de-activate
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
                  if (index != null) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 35.0),
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

  void _showImagePopup(List<Map<String, dynamic>> users, int initialUserIndex,
      int initialImageIndex) {
    int currentUserIndex = initialUserIndex;
    int? currentImageIndex = initialImageIndex;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(0),
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // Swipe down
                    setState(() {
                      currentUserIndex =
                          (currentUserIndex - 1 + users.length) % users.length;
                      currentImageIndex =
                          0; // Reset image index when user changes
                    });
                  } else if (details.primaryVelocity! < 0) {
                    // Swipe up
                    setState(() {
                      currentUserIndex = (currentUserIndex + 1) % users.length;
                      currentImageIndex =
                          0; // Reset image index when user changes
                    });
                  }
                },
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    // Swipe right
                    setState(() {
                      currentImageIndex = ((currentImageIndex! -
                              1 +
                              users[currentUserIndex]['images'].length) %
                          users[currentUserIndex]['images'].length) as int?;
                    });
                  } else if (details.primaryVelocity! < 0) {
                    // Swipe left
                    setState(() {
                      currentImageIndex = ((currentImageIndex! + 1) %
                          users[currentUserIndex]['images'].length) as int?;
                    });
                  }
                },
                child: Stack(
                  children: [
                    Image.asset(
                      users[currentUserIndex]['images'][currentImageIndex],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: List.generate(
                            users[currentUserIndex]['images'].length, (index) {
                          return Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: index == currentImageIndex
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  users[currentUserIndex]['images']
                                      [currentImageIndex]),
                              radius: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              users[currentUserIndex]['username'],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
          decoration: const BoxDecoration(
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
