import 'package:flutter/material.dart';
import 'package:sigma_task/models/data.dart';

Color kAccentColour = Color(0xFFD81A60);
Map<String, bool> kAmenities = {
  'Wifi': false,
  'Projector': false,
  'Whiteboard': false,
  'Printer/Scanner': false,
  'TV/Monitor': false,
  'Kitchen': false,
};
TextStyle kSmallTextStyle=TextStyle(
  color:Colors.black,
  fontSize:20
);
List<Spaces> sampleData = [
  Spaces(
    name: 'Apartment 1',
    address: 'Random Address 1',
    numberOfRooms: 2,
    price: 5500,
    rating: 3,
    amenities: {
      'Wifi': true,
      'Projector': false,
      'Whiteboard': false,
      'Printer/Scanner': true,
      'TV/Monitor': true,
      'Kitchen': false,
    },
  ),
  Spaces(
    name: 'Flat 1',
    address: 'Random Address 2',
    numberOfRooms: 3,
    price: 3000,
    rating: 2,
    amenities: {
      'Wifi': true,
      'Projector': false,
      'Whiteboard': true,
      'Printer/Scanner': false,
      'TV/Monitor': false,
      'Kitchen': true,
    },
  ),
  Spaces(
    name: 'Apartment 2',
    address: 'Random Address 3',
    numberOfRooms: 1,
    price: 2500,
    rating: 4,
    amenities: {
      'Wifi': false,
      'Projector': true,
      'Whiteboard': true,
      'Printer/Scanner': false,
      'TV/Monitor': true,
      'Kitchen': false,
    },
  ),
  Spaces(
    name: 'Flat 2',
    address: 'Random Address 3',
    numberOfRooms: 2,
    price: 4000,
    rating: 1,
    amenities: {
      'Wifi': true,
      'Projector': true,
      'Whiteboard': false,
      'Printer/Scanner': true,
      'TV/Monitor': false,
      'Kitchen': false,
    },
  ),
  Spaces(
    name: 'Flat 3',
    address: 'Random Address 3',
    numberOfRooms: 1,
    price: 1500,
    rating: 5,
    amenities: {
      'Wifi': false,
      'Projector': false,
      'Whiteboard': true,
      'Printer/Scanner': true,
      'TV/Monitor': false,
      'Kitchen': true,
    },
  )
];
