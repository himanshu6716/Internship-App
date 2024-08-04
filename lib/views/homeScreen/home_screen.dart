import 'package:flutter/material.dart';
import 'package:assingment/models/internship.dart'; // Adjust import path if necessary
import 'package:assingment/services/remote_service.dart';
import 'package:assingment/views/homeScreen/filtersScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Internship>> _internshipList;

  @override
  void initState() {
    super.initState();
    _internshipList = RemoteServices().fetchInternships(); // Fetch internships on screen load
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internships'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FiltersScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Internship>>(
        future: _internshipList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No internships available'));
          } else {
            // Flatten the list of internships and use InternshipsMeta to access properties
            final internships = snapshot.data!;
            return ListView.builder(
              itemCount: internships.length,
              itemBuilder: (context, index) {
                final internship = internships[index];
                final meta = internship.internshipsMeta.values.first; // Accessing the first meta item for simplicity
                return ListTile(
                  title: Text(meta.title ?? 'No title'),
                  subtitle: Text(meta.companyName ?? 'No company name'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
