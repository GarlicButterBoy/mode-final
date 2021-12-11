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



class MySettingsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Home Page'),
          onPressed: () {
            //Navigate Back Home
            Navigator.pop(context);
          },
          ),
      ),
    );
  }
}


class DeleteMediaPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Media Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Home'),
          onPressed: () {
            //Navigate Back Home
            Navigator.pop(context);
          },
          ),
      ),
    );
  }
}

//TODO: Change this to HOME Screen
class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
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
        ElevatedButton(
          child: Text('Settings Page'),
          onPressed: () {
            //Navigate to Settings
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MySettingsPage()),
            );
          }, //Settings Page Navigation
          ),
          ElevatedButton(
          child: Text('View Page'),
          onPressed: () {
            //Navigate to Settings
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewMediaPage()),
            );
          }, //Settings Page Navigation
          ),
        ],
      ),
    );
  }
}
//TODO: Update this page to be the VIEW page
class ViewMediaPage extends StatefulWidget {
  @override
  State<ViewMediaPage> createState() => _ViewMediaPageState();
}

class _ViewMediaPageState extends State<ViewMediaPage> {
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

//TODO: This doesn't do anything - Trying to delete a list item
  // void _deleteMedia(String id)
  // {
  //   //TODO: Actually write some code that deletes the item
  //   setState(() {
  //     _userMedia.removeWhere((element) => false);
  //   });
  // }
  
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
//TODO: This doesn't do anything - Trying to pop up warning of deletion
  // void _startDeleteMedia(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx, 
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: DeleteMediaPage(_deleteMedia()),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //     );
  // }

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
                  'View the media here:',
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
          child: Text('Home'),
          onPressed: () {
            //Navigate Back Home
            Navigator.pop(context);
          },
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
