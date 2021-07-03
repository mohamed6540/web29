import 'dart:async';
import 'dart:html';

import 'package:admin/screens/dashboard/components/recent_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';

class Devices extends StatefulWidget {
  static const String id = 'devices';
  State<StatefulWidget> createState() {
    return HomeState();
  }
}
class HomeState extends State<Devices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hospital system",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
              })
        ],
        centerTitle: true,
        elevation: 20,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Expanded(
                    child: ListView( 
            children: <Widget>[
              Expanded(child:Image.asset('images/done.jpg'),
              ),
         ElevatedButton(
              onPressed:null,
              child: Text('report error'),
            ),
            SizedBox(
              height: 200,
              width: 200,
            ),  
             Text(
              'hello',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            ],
          ),
              ),
              Expanded(
              flex: 2,
               child: ListView(
            children: <Widget>[      
         Container(
           width: double.maxFinite,
   child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
          Text(
            "Recent Requests",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Discription"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("User"),
                ),
                DataColumn(
                  label: Text("State"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
        ),
     Text( 
      'hello',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
           
        ],
        ),   
      ),
      ],
        ),
      ),
    );
  }
}