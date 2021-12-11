import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class NewMedia extends StatefulWidget {
  final Function addPlant;

  NewMedia(this.addPlant);

  @override
  State<NewMedia> createState() => _NewMediaState();
}

//TODO: BUG? - When typing into the text fields, the screen doesn't scroll and you can't see what you're typing after rating. 

class _NewMediaState extends State<NewMedia> {
  //Controllers for Create Screen
  final nameController = TextEditingController();
  final ratingController = TextEditingController();
  final typeController = TextEditingController();
  final reviewController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredRating = double.parse(ratingController.text);
    final enteredType = typeController.text;
    final enteredReview = reviewController.text;

    if (enteredName.isEmpty || enteredType.isEmpty || enteredRating < 1)
    {
      return;
    }

    widget.addPlant(
              enteredName, 
              enteredRating, 
              enteredType,
              enteredReview
            );

            Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
        return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Media Name: ',
                    ),
                    controller: nameController,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(decoration: InputDecoration(
                      labelText: 'Rating: ',
                    ),
                    controller: ratingController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData()
                  ),
                  TextField(decoration: InputDecoration(
                      labelText: 'Type: ',
                    ),
                    controller: typeController,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(decoration: InputDecoration(
                      labelText: 'Review: ',
                    ),
                    controller: reviewController,
                    onSubmitted: (_) => submitData(),
                  ),
                  FlatButton(
                    
                    onPressed: submitData, 
                    child: Text('Add Media'),
                    color: Colors.blue,
                  ),
                ],

              ),
            ),
          );
        },
      ),
    );
  }
}