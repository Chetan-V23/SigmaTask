import 'package:flutter/material.dart';
import 'package:sigma_task/utilities/constants.dart';

class Spaces {
  String name;
  String address;
  int rating = 0;
  Map<String, bool> amenities = kAmenities;
  int numberOfRooms;
  double price;

  List<Icon> getStars() {
    //print('$rating');
    List<Icon> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(
        Icon(
          Icons.star,
          color: (i < rating) ? Colors.blue : Colors.grey,
        ),
      );
    }
    return stars;
  }

  Spaces({
    @required this.name,
    @required this.address,
    @required this.numberOfRooms,
    @required this.price,
    this.amenities,
    @required this.rating,
  });

  Widget getDataWidget() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: <Widget>[
            //image
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('images/randomhouse.jpg')),
            ),
            //data
            Padding(
              padding: const EdgeInsets.all(.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //name and address
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      Row(
                          
                          children: <Widget>[
                            Icon(Icons.place),
                            Text(address),
                          ]),
                    ],
                  ),
                  Row(
                    children: getStars(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
