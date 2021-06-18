import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/Config/config.dart';
import 'package:flutter/services.dart';
import '../Widgets/loadingWidget.dart';
import '../Widgets/orderCard.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}



class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: StreamBuilder<QuerySnapshot>(
          stream: EcommerceApp.firestore
            .collection(EcommerceApp.collectionUser)
            .document(EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID))
            .collection(EcommerceApp.collectionOrders).orderBy('orderTime', descending: true).snapshots(),

          builder: (c, snapshot){
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (c, index){
                      return FutureBuilder<QuerySnapshot>(
                          future: Firestore.instance
                            .collection("items")
                            .where("shortInfo", whereIn: snapshot.data.documents[index].data[EcommerceApp.productID])
                          .getDocuments(),

                          builder: (c, snap){
                            return snap.hasData
                            ? OrderCard(
                              itemCount: snap.data.documents.length,
                              data: snap.data.documents,
                              orderID: snapshot.data.documents[index].documentID,
                              orderStatus: snapshot.data.documents[index].data['orderStatus'],
                              cancellationStatus: snapshot.data.documents[index].data['cancellationStatus'],
                              adminOrderCancellationStatus: snapshot.data.documents[index].data['adminOrderCancellationStatus'],
                              totalPrice: snapshot.data.documents[index].data['totalAmount'].toString(),
                            )
                                : Center(child: circularProgress(),);
                          }

                      );
                    },
                  )
                : Center(child: circularProgress(),);
          }
          ,
        ),
      ),
    );
  }
}
