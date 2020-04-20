import 'package:flutter/material.dart';
import 'package:sigma_task/utilities/constants.dart';
import 'filter_result_page.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Map<String, bool> amenities = kAmenities;
  List<String> amenitiesList = [];
  List<Widget> amenitiesButtonsList = [];
  RangeValues priceRangeValues = RangeValues(2000, 3000);
  int rating = 1;
  int numberOfRooms = 1;
  List<DropdownMenuItem> ratingList = [];
  List<DropdownMenuItem> roomList = [];
  @override
  void initState() {
    amenities.entries.forEach((e) => amenitiesList.add(e.key));

    for (var amenity in amenitiesList) {
      amenitiesButtonsList.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleButtons(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(amenity,style: TextStyle(color: kAccentColour),),
              )
            ],
            isSelected: [amenities[amenity]],
            onPressed: (value) {
              setState(() {
                amenities[amenity] = !amenities[amenity];
                print('$amenity ${amenities[amenity]}');
              });
            },
            selectedColor: Colors.lightBlueAccent,
            fillColor: Colors.lightBlueAccent,
            color: kAccentColour,
          ),
        ),
      );
    }

    for (int i = 1; i <= 5; i++)
      ratingList.add(DropdownMenuItem(
        child: Text('$i'),
        value: i,
      ));

    for (int i = 1; i <= 4; i++)
      roomList.add(DropdownMenuItem(
        child: Text('$i'),
        value: i,
      ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Filters',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Rating:',
                  style: kSmallTextStyle,
                ),
                SizedBox(width: 20),
                DropdownButton(
                  style: kSmallTextStyle,
                  items: ratingList,
                  value: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value.toInt();
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Price',
              style: kSmallTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '${priceRangeValues.start.round()}',
                  style: TextStyle(fontSize: 15),
                ),
                RangeSlider(
                  values: priceRangeValues,
                  onChanged: (values) {
                    setState(() {
                      priceRangeValues = values;
                    });
                  },
                  max: 6000,
                  min: 1000,
                  activeColor: kAccentColour,
                  //inactiveColor: kAccentColour,
                ),
                Text(
                  '${priceRangeValues.end.round()}',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Rooms:',
                  style: kSmallTextStyle,
                ),
                SizedBox(width: 20),
                DropdownButton(
                  items: roomList,
                  style: kSmallTextStyle,
                  value: numberOfRooms,
                  onChanged: (value) {
                    setState(
                      () {
                        numberOfRooms = value.toInt();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            direction: Axis.horizontal,
            children: amenitiesButtonsList,
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterResultPage(rating:rating,numberOfRooms: numberOfRooms,priceRange: priceRangeValues,amenitiesMap: amenities,)));
            },
            color: kAccentColour,
            child: Text(
              'Add Filters and Search',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
