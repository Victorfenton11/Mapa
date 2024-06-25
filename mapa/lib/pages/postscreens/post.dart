import 'package:flutter/material.dart';
import 'package:mapa/constants.dart' as constants;

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _currentIndex = 0;

  final List<Widget> _inputWidgets = [
    Column(
      children: [
        TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Location',
            suffixIcon: IconButton(
              icon: const Icon(Icons.location_on),
              onPressed: () {
                // Add your action for the location icon button here
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Description',
            suffixIcon: IconButton(
              icon: const Icon(Icons.description),
              onPressed: () {
                // Add your action for the description icon button here
              },
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Add your action for adding image here
          },
          child: const Text('Add Image'),
        ),
      ],
    ),
    Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Add your action for date picker here
          },
          child: const Text('Add Date'),
        ),
      ],
    ),
    Column(
      children: [
        const Text('Rate your experience:'),
        Slider(
          value: 3,
          min: 1,
          max: 5,
          divisions: 4,
          onChanged: (value) {
            // Add your action for rating here
          },
        ),
      ],
    ),
  ];

  void _onArrowPressed(bool isNext) {
    setState(() {
      if (isNext && _currentIndex < _inputWidgets.length - 1) {
        _currentIndex = (_currentIndex + 1) % _inputWidgets.length;
      } else if (!isNext && _currentIndex > 0){
        _currentIndex = (_currentIndex - 1 + _inputWidgets.length) % _inputWidgets.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, size: 40, color: Colors.black),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    "Log your travel!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: _inputWidgets[_currentIndex],
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _onArrowPressed(false);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color(constants.LIGHT_BLUE),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onArrowPressed(true);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color(constants.LIGHT_BLUE),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
