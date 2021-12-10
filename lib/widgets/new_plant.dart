import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class NewPlant extends StatefulWidget {
  final Function addPlant;

  NewPlant(this.addPlant);

  @override
  State<NewPlant> createState() => _NewPlantState();
}

class _NewPlantState extends State<NewPlant> {
  final nameController = TextEditingController();

  final costController = TextEditingController();

  final typeController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredCost = double.parse(costController.text);
    final enteredType = typeController.text;

    if (enteredName.isEmpty || enteredType.isEmpty || enteredCost < 0.01)
    {
      return;
    }

    widget.addPlant(
              enteredName, 
              enteredCost, 
              enteredType
            );

            Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Plant Name: ',
                  ),
                  controller: nameController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(decoration: InputDecoration(
                    labelText: 'Cost: ',
                  ),
                  controller: costController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData()
                ),
                TextField(decoration: InputDecoration(
                    labelText: 'Type: ',
                  ),
                  controller: typeController,
                  onSubmitted: (_) => submitData(),
                ),
                FlatButton(
                  
                  onPressed: submitData, 
                  child: Text('Add Plant'),
                  color: Colors.blue,
                ),
              ],

            ),
          ),
        );
  }
}