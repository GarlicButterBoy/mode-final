// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'dart:io';

import 'package:flutter/material.dart';
import '/widgets/new_media.dart';
import '/widgets/media_list.dart';

import 'models/media.dart';

// list for media
final List<Media> _userMedia = [
  Media(
    id: 1,
    name: 'Pet Sematary',
    rating: 5,
    date: DateTime.now(),
    type: 'Book',
    review: "This was pretty good.",
  ),
  Media(
    id: 2,
    name: 'The Devil Below',
    rating: 1,
    date: DateTime.now(),
    type: 'Movie',
    review: "This sucked!",
  ),
];

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Remove all Media?'),
                SizedBox(width: 15),
                ElevatedButton(
                  child: Text('Yes'),
                  onPressed: () {
                    _userMedia.clear();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Sort Media by Rating?'),
                SizedBox(width: 15),
                ElevatedButton(
                  child: Text('Yes'),
                  onPressed: () {
                    _userMedia.sort();
                  },
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Home Page'),
              onPressed: () {
                //Navigate Back Home
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteMediaPage extends StatelessWidget {
  int index = 0;

  DeleteMediaPage(int index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Media Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Are you sure you want to delete?"),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(
                child: Text('Yes'),
                onPressed: () {
                  int testId = _userMedia[index].id;
                  _userMedia.removeWhere((media) => media.id == testId);
                  //Reload page
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewMediaPage()));
                },
              ),
              SizedBox(width: 5),
              ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    //Navigate Back Home
                    Navigator.pop(context);
                  }),
            ]),
          ],
        ),
      ),
    );
  }
}

//HOME Screen
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            child: Text('View Page'),
            onPressed: () {
              //Navigate to Settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewMediaPage()),
              );
            }, //Settings Page Navigation
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

  // final List<Media> _userMedia = [
  //   Media(
  //     id: 1,
  //     name: 'Pet Sematary',
  //     rating: 5,
  //     date: DateTime.now(),
  //     type: 'Book',
  //     review: "This was pretty good.",
  //   ),
  //   Media(
  //     id: 2,
  //     name: 'The Devil Below',
  //     rating: 1,
  //     date: DateTime.now(),
  //     type: 'Movie',
  //     review: "This sucked!",
  //   ),
  // ];

  void _addNewMedia(String name, double rating, String type, String review) {
    if (review == "") {
      review = "No Review";
    }

    final newMedia = Media(
      name: name,
      rating: rating,
      type: type,
      review: review,
      date: DateTime.now(),
      id: _userMedia.length + 1,
    );

    // if rating is in range
    if ((rating <= 5) && (rating >= 0)) {
      setState(() {
        _userMedia.add(newMedia);
      });
    } else {
      _startAddNewMedia(context);
    }
  }

  // void _deleteMedia(int index) {
  //   int testId = _userMedia[index].id;
  //   _userMedia.removeWhere((media) => media.id == testId);
  //   //Reload page
  //   ViewMediaPage();
  // }

//TODO: This doesn't do anything - Trying to pop up warning of deletion
  // void _startDeleteMedia(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: DeleteMediaPage(),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //   );
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
