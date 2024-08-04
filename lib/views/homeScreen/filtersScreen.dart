import 'package:flutter/material.dart';
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String profile = '';
  String city = '';
  String duration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Profile of internship'),
              onChanged: (value) {
                setState(() {
                  profile = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'City of internship'),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Duration of internship'),
              onChanged: (value) {
                setState(() {
                  duration = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}