import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/adminOrderCard.dart';
import 'package:e_shop/Config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/loadingWidget.dart';
import '../Widgets/orderCard.dart';

class AdminDeliveredOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}


class _MyOrdersState extends State<AdminDeliveredOrders> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.pink, Colors.lightGreenAccent],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          centerTitle: true,
          title: Text("My Orders", style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
                icon: Icon(Icons.arrow_drop_down_circle, color: Colors.white,),
                onPressed: (){
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Container(

          child: MaterialButton(
            onPressed: (){

            },
          ),

        )
        // StreamBuilder<QuerySnapshot>(
        //   stream: Firestore.instance
        //       .collection(EcommerceApp.collectionUser)
        //       .snapshots(),
        //
        //   // builder: (c, snapshot){
        //   //
        //   //   print(snapshot.data.documents[9].data['uid']);
        //   //   //
        //   //   // return snapshot.hasData?
        //   //   //
        //   //   //     : Center(child: circularProgress(),);
        //   // }
        //
        // ),
      ),
    );
  }

   getDocuments() async {



  }
}
