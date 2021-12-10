import 'package:flutter/material.dart';
import '../models/plant.dart';
import 'package:intl/intl.dart';

class PlantList extends StatelessWidget {
  final List<Plant> plants;
  PlantList(this.plants);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
      child: ListView.builder(
            itemBuilder: (context, index) { 
              return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                    '\$${plants[index].amount.toStringAsFixed(2)}',
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
                      plants[index].name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    Text(
                      '${DateFormat('EEE, y-MMM, d').format(plants[index].date)} -- Type: ${plants[index].type}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      ),
                  ],
                  ),
                ],
              ),
              );
             },
            itemCount: plants.length,
           ),
    );
  }
}