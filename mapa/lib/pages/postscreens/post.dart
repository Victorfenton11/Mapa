import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mapa/constants.dart' as constants;
import 'dart:io';

import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _currentIndex = 0;
  List<File> _images = [];
  double _rating = 0.0;
  DateTimeRange? _selectedDateRange;

  static const kGoogleApiKey = 'YOUR_GOOGLE_API_KEY';
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

  void _onArrowPressed(bool isNext) {
    setState(() {
      if (isNext && _currentIndex < _getInputWidgets().length - 1) {
        _currentIndex = (_currentIndex + 1) % _getInputWidgets().length;
      } else if (!isNext && _currentIndex > 0) {
        _currentIndex = (_currentIndex - 1 + _getInputWidgets().length) %
            _getInputWidgets().length;
      }
    });
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedImages = await picker.pickMultiImage();

    if (pickedImages != null) {
      setState(() {
        _images = pickedImages.map((image) => File(image.path)).toList();
      });
    }
  }

  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      mode: Mode.overlay, // Mode.fullscreen
      language: "en",
      components: [Component(Component.country, "us")],
    );

    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;

      _locationController.text = p.description!;
    }
  }

  List<Widget> _getInputWidgets() {
    return [
      Column(
        children: [
          TextField(
            controller: _locationController,
            readOnly: true,
            onTap: _handlePressButton,
            decoration: InputDecoration(
              labelText: 'Location',
              suffixIcon: IconButton(
                icon: const Icon(Icons.location_on),
                onPressed: _handlePressButton,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
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
          const Row(
            children: [
              Text(
                'Want to add images?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _pickImages,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(constants.GREY),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                child: const Text(
                  'Add Image',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_images.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Image.file(_images[index]);
                },
              ),
            ),
        ],
      ),
      Column(
        children: [
          const Row(
            children: [
              Text(
                "Make post public?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ToggleSwitch(
            minWidth: double.infinity,
            cornerRadius: 20.0,
            activeBgColors: const [
              [Color(constants.GREEN)],
              [Color(constants.GREY)]
            ],
            activeFgColor: Colors.black,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.black,
            initialLabelIndex: 1,
            totalSwitches: 2,
            labels: const ['Yes', 'No'],
            radiusStyle: true,
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Text(
                "Length of your stay",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  DateTimeRange? pickedDateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDateRange != null) {
                    setState(() {
                      _selectedDateRange = pickedDateRange;
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    const Color(constants.GREY),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                child: const Text(
                  'Add Date Range',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_selectedDateRange != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'From: ${_selectedDateRange!.start.year}-${_selectedDateRange!.start.month}-${_selectedDateRange!.start.day}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 15),
                Text(
                  'To: ${_selectedDateRange!.end.year}-${_selectedDateRange!.end.month}-${_selectedDateRange!.end.day}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ],
      ),
      Column(
        children: [
          const Row(
            children: [
              Text(
                'Rate your experience',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 10),
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Your rating: $_rating',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    ];
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
                    icon: const Icon(Icons.arrow_back,
                        size: 40, color: Colors.black),
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
              child: _getInputWidgets()[_currentIndex],
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
