import 'package:flutter/material.dart';
import 'package:sigma_task/utilities/constants.dart';
import 'data.dart';

class SpacesDatabase extends ChangeNotifier {
  List<Spaces> spaceDatabase = sampleData;

  void addSpace(int i) {
    spaceDatabase.add(
      Spaces(
          name: 'Random name $i',
          address: 'Random Address $i',
          numberOfRooms: i,
          price: 5500,
          rating: i),
    );
    ChangeNotifier();
  }

  int get databaseSize{
    return spaceDatabase.length;
  }

  List<Widget> getSearchResults(String name)
  {
    List<Widget> searchResults=[];
    for(int i=0;i<spaceDatabase.length;i++)
    {
      
      if(spaceDatabase[i].name.toLowerCase().contains(name.toLowerCase()))
       {
         searchResults.add(spaceDatabase[i].getDataWidget());
       } 
    }
    return searchResults; 
  }

  bool checkAmenties(Map<String,bool>requirement,int i)
  {
    List<String> amenitiesList=[];
    int flag=1;
    kAmenities.entries.forEach((e) => amenitiesList.add(e.key));
    for(var amenity in amenitiesList)
    {
      if(!(!requirement[amenity]||spaceDatabase[i].amenities[amenity]))
        {flag=0;break;}
    }
    if(flag==1)
    return true;
    else
    return false;

  }

  List<Widget>getFilterResults(int rating, int rooms, Map<String,bool>amenities, RangeValues priceRange)
  {
    List<Widget> filterResults=[];
    for(int i=0;i<spaceDatabase.length;i++)
    {
      if(
        spaceDatabase[i].rating>=rating && 
        spaceDatabase[i].numberOfRooms==rooms &&
        spaceDatabase[i].price>=priceRange.start &&
        spaceDatabase[i].price<=priceRange.end &&
        checkAmenties(amenities, i)
      )
      filterResults.add(spaceDatabase[i].getDataWidget());
    }
    return filterResults;
  }
}
