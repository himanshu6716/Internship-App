import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assingment/models/internship.dart'; // Adjust import path if necessary

class RemoteServices {
  Future<List<Internship>> fetchInternships() async {
    var client = http.Client();

    try {
      var uri = Uri.parse('https://internshala.com/flutter_hiring/search'); // Example URL
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var internshipsData = jsonResponse['internships_meta'] as List<dynamic>;

        // Ensure Internship.fromJson is correctly implemented
        return internshipsData.map((data) => Internship.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load internships');
      }
    } finally {
      client.close();
    }
  }
}
