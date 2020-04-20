import 'package:flutter/material.dart';
import 'package:sigma_task/models/database.dart';
import 'package:sigma_task/screens/search_result_page.dart';
import 'package:sigma_task/utilities/constants.dart';
import 'fliter_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {

  List<Widget> getList(BuildContext context) {
    List<Widget> demoWidgetObjects = [];
    for (int i = 1; i <= 5; i++) {
      demoWidgetObjects.add(
        Provider.of<SpacesDatabase>(context).spaceDatabase[i - 1].getDataWidget(),
      );
    }
    return demoWidgetObjects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Category')),
        backgroundColor: kAccentColour,
      ),
      body: Column(
        children: <Widget>[
          //Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: kAccentColour,
                ),
                hintText: 'Search Your Space',
                hintStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
              onSubmitted: (value){
              
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResultPage(name: value,)));
                //searchResults: searchResults,
              },
            ),
          ),
          //Filter button
          Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Filter'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Icon(Icons.filter_list),
                  )
                ],
              ),
              onPressed: () {
                // print("HERE");
                showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor:Color(0xff757575),
                builder: (context) => SingleChildScrollView(
                    child:FilterBottomSheet()
                )
            );
              },
            ),
          ),
          //Featured
          Container(
            margin: EdgeInsets.fromLTRB(15,0,15,7),
            alignment: Alignment.centerLeft,
            child: Text(
              'Featured',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          //ListView
          Expanded(
            child: ListView(
              children: getList(context),
            ),
          )
        ],
      ),
    );
  }
}
