import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  String? profilePictureUrl;

  @override
  void initState() {
    super.initState();
    // Replace 'YOUR_ACCESS_TOKEN' with the actual Facebook access token
    String accessToken = 'EAALSCYQXlZAwBO9iiilvinnnsOJZAuuglHjCRKwkm2tsKZBImAU3pZB6urvbbv0fo6k2XovbhwMCjy1cpQTJZCX1dHaGnisdACoMyUkX6JnN0gAVZBWrM792hht6DEvPfM5VbrZB2YbZC5ZCgWZC5riKcaYb4K5392ee9EZCKg3i145rU3kYdPB1aLBuiZBNSoRQeBE4KVdzFJZArXqn4KvjJMnZBx7jk0jMmABYaUuNffk2PjkyBSX5sy7hIBCz8QeztSeCRC0USXNqlWouoy';
    fetchProfilePicture(accessToken);
  }

  Future<void> fetchProfilePicture(String accessToken) async {
    final response = await http.get(
      Uri.parse('https://graph.facebook.com/rv12.0/me/picture?redirect=false&type=large'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        profilePictureUrl = data['data']['url'];
      });
    } else {
      print('Failed to load profile picture: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Profile Picture'),
      ),
      body: Center(
        child: profilePictureUrl != null
            ? CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profilePictureUrl!),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
