// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/media.dart';
import 'package:intl/intl.dart';
import '../main.dart';

// class ViewMedia extends StatefulWidget {
//   final Function viewMedia;

//   ViewMedia(this.viewMedia);

//   @override
//   State<ViewMedia> createState() => _ViewMediaState();
// }

// class _ViewMediaState extends State<ViewMedia>
// {
//   final name = TextField();
//   final rating = TextField();
//   final type = TextField();
//   final review = TextField();

// }

class MediaList extends StatelessWidget {
  final List<Media> media;
  MediaList(this.media);

  void _viewMediaItem(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${media[index].rating.toStringAsFixed(0)}/5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        media[index].name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${DateFormat('EEE, y-MMM, d').format(media[index].date)} -- Type: ${media[index].type}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // Button to open delete confirmation page
                            ElevatedButton(
                              child: Text('Delete'),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: DeleteMediaPage(index),
                                      behavior: HitTestBehavior.opaque,
                                    );
                                  },
                                );
                              },
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              media[index].name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              media[index].review,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${media[index].rating.toStringAsFixed(0)}/5',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              'This review was submitted on: ${media[index].date}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      behavior: HitTestBehavior.opaque,
                    );
                  });
            },
          );
        },
        itemCount: media.length,
      ),
    );
  }
}
