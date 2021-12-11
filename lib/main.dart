import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lab6_mode/widgets/new_media.dart';
import 'package:lab6_mode/widgets/media_list.dart';

import 'models/media.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MODE4201 Final - Media Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class MySettingsPage extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Settings Page'),
//           onPressed: () {
//             //Navigate Back Home
//             Navigator.pop(context);
//           },
//           ),
//       ),
//     );
//   }
// }


class _MyHomePageState extends State<MyHomePage> {
  // final nameController = TextEditingController();

  // final costController = TextEditingController();

  // final typeController = TextEditingController();

final List<Media> _userMedia = [
    Media(
      id: 'm1', 
      name: 'Pet Sematary', 
      rating: 5, 
      date: DateTime.now(),
      type: 'Book',
      review: "This was pretty good.",
      ),
    Media(
      id: 'm2', 
      name: 'The Devil Below', 
      rating: 1, 
      date: DateTime.now(),
      type: 'Movie',
      review: "This sucked!",
      ),
  ];
  
  void _addNewMedia(String name, double rating, String type, String review) 
  {

    if (review == "")
    {
      review = "No Review";
    }

    final newMedia = Media(
      name: name, 
      rating: rating, 
      type: type, 
      review: review,
      date: DateTime.now(), 
      id: DateTime.now().toString(),
    );

    setState(() {
      _userMedia.add(newMedia);
    });
  }

  void _startAddNewMedia(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewMedia(_addNewMedia),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Media Tracker Home'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: () => _startAddNewMedia(context), 
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
                child: Text(
                  'Welcome to our Final Project for MODE4201 - This app will let you track what media you\'ve been consuming.',
                  style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                ),
                elevation: 5,
                ),
          ),
          MediaList(_userMedia),
          ElevatedButton(
          child: Text('Settings Page'),
          onPressed: () {
            //Navigate to Settings
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => MySettingsPage()),
            // );
          }, //Settings Page Navigation
          ),
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add_box_outlined),
      onPressed: () => _startAddNewMedia(context),
      ),
      
    );
  }
}
