import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewServiceRequest extends StatefulWidget {
  final String serviceID;

  ViewServiceRequest({Key key, this.serviceID}) : super(key: key);

  @override
  _ViewServiceRequestState createState() => _ViewServiceRequestState();
}

class _ViewServiceRequestState extends State<ViewServiceRequest> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
            future: EcommerceApp.firestore
                .collection('services')
                .document(widget.serviceID)
                .get(),
            builder: (c, snapshot) {
              Map dataMap;
              if (snapshot.hasData) {
                dataMap = snapshot.data.data;
              }

              return snapshot.hasData
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Text(
                                "VIEW SERVICE REQUEST",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26),
                              )),
                        Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Name  : " , style: TextStyle( fontWeight:  FontWeight.bold, fontSize: 20),),
                                      Text(dataMap['name'], style: TextStyle( fontSize: 20),)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Contact Details : " , style: TextStyle( fontWeight:  FontWeight.bold, fontSize: 20),),
                                      Text(dataMap['contactNumber'], style: TextStyle( fontSize: 20),)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Service : " , style: TextStyle( fontWeight:  FontWeight.bold, fontSize: 20),),
                                      Text(dataMap['category'], style: TextStyle( fontSize: 20),)
                                    ],
                                  ),
                                  SizedBox(height: 10, ),
                                  Text("Description : ", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),),
                                  Text( dataMap['description'].toString().length!=0? dataMap['description'] : "No Description", style: TextStyle( fontSize: 20),)

                                ],
                              ),

                            ),

                        ],
                      ),
                    )
                  : Center(
                child: CupertinoActivityIndicator( radius: 30,),
              );
            },
          ),
        ),
      ),
    );
  }
}
