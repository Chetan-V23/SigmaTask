import 'package:flutter/material.dart';
import 'package:sigma_task/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:sigma_task/models/database.dart';

class FilterResultPage extends StatelessWidget {
  
  FilterResultPage({this.rating,this.numberOfRooms,this.priceRange,this.amenitiesMap});

  final int rating;
  final int numberOfRooms;
  final RangeValues priceRange;
  final Map<String,bool> amenitiesMap;


  @override
  Widget build(BuildContext context) {
    List<Widget> filterResults=[];
    filterResults= Provider.of<SpacesDatabase>(context).getFilterResults(rating,numberOfRooms,amenitiesMap,priceRange);
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Filter Results'),
        backgroundColor: kAccentColour,
      ),
      body:ListView(children: filterResults,)
    );
  }
}
