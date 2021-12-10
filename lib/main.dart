import 'package:flutter/material.dart';
import 'package:lab6_mode/widgets/new_plant.dart';
import 'package:lab6_mode/widgets/plant_list.dart';

import 'models/plant.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MODE4201 - Lab 7',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final nameController = TextEditingController();

  // final costController = TextEditingController();

  // final typeController = TextEditingController();

final List<Plant> _userPlants = [
    Plant(
      id: 'p1', 
      name: 'Tomato Plant', 
      amount: 7.69, 
      date: DateTime.now(),
      type: 'Plant',
      ),
    Plant(
      id: 'p2', 
      name: 'Oyster Mushrooms', 
      amount: 14.99, 
      date: DateTime.now(),
      type: 'Mushroom',
      ),
  ];
  
  void _addNewPlant(String name, double cost, String type) {
    final newPlant = Plant(
      name: name, 
    amount: cost, 
    type: type, 
    date: DateTime.now(), 
    id: DateTime.now().toString(),
    );

    setState(() {
      _userPlants.add(newPlant);
    });
  }

  void _startAddNewPlant(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewPlant(_addNewPlant),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Lab 7 Home'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_box_outlined),
          onPressed: () => _startAddNewPlant(context), 
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
                  'CHART!',
                  style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                ),
                elevation: 5,
                ),
          ),
          PlantList(_userPlants),
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add_box_outlined),
      onPressed: () => _startAddNewPlant(context),
      ),
      
    );
  }
}
