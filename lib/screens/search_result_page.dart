import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_task/utilities/constants.dart';
import 'package:sigma_task/models/database.dart';

//int numberOfResults;

class SearchResultPage extends StatelessWidget {
  final String name;
  SearchResultPage({this.name});
  
  @override
  Widget build(BuildContext context) {
    List<Widget> searchResults=[];
    searchResults= Provider.of<SpacesDatabase>(context).getSearchResults(name);
    print(searchResults.length);
    
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text('Search Results'),
        backgroundColor: kAccentColour,
      ),
      // body: ListView.builder(
      //   itemBuilder: (context,index){
      //     return searchResults[index];
      //     //getList(context)
      //   },
      //   itemCount: numberOfResults,
      //   ),
      body:ListView(children: searchResults,)
    );
  }
  
}
