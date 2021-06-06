import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Orders/OrderDetailsPage.dart';
import 'package:e_shop/Models/item.dart';
import 'package:flutter/material.dart';
import '../Store/storehome.dart';

class OrderCard extends StatelessWidget {
  final int itemCount;
  final List<DocumentSnapshot> data;
  final String orderID;
  final String cancellationStatus;
  final String orderStatus;
  final String adminOrderCancellationStatus;
  final String totalPrice;

  OrderCard(
      {Key key,
      this.itemCount,
      this.data,
      this.orderID,
      this.cancellationStatus,
      this.orderStatus,
      this.adminOrderCancellationStatus,
      this.totalPrice
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(builder: (c) {
          return OrderDetails(orderID: orderID);
        });

        Navigator.push(context, route);
      },
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.pink, Colors.lightGreenAccent],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        height: itemCount * 190.0,
        child: ListView.builder(
            itemCount: itemCount,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (c, index) {
              ItemModel model = ItemModel.fromJson(data[index].data);
              return sourceOrderInfo(model, context, cancellationStatus,
                  orderStatus, adminOrderCancellationStatus, totalPrice);
            }),
      ),
    );
  }
}

Widget sourceOrderInfo(
    ItemModel model,
    BuildContext context,
    String cancellationStatus,
    String orderStatus,
    String adminOrderCancellationStatus,
    String totalPrice,
    {Color background}) {
  print(cancellationStatus);

  width = MediaQuery.of(context).size.width;

  return Container(
    color: Colors.grey[100],
    height: 170.0,
    width: width,
    child: Row(
      children: [
        Image.network(
          model.thumbnailUrl,
          width: 180.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      model.title,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      model.shortInfo,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Row(
                          children: [
                            Text(
                              r"Total Price: ₹ ",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              totalPrice,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(height: 30.0,),
            isCancelled(cancellationStatus)
                ? Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(width: 3.0, color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(
                              20.0) //         <--- border radius here
                          ),
                    ), //       <--- BoxDecoration here
                    child: Text(
                      "Order Cancelled",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  )
                : isCancelled(adminOrderCancellationStatus)
                    ? Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 3.0, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Text(
                          "Admin Cancelled Order",
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(width: 3.0, color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  20.0) //         <--- border radius here
                              ),
                        ), //       <--- BoxDecoration here
                        child: Center(
                          child: Text(
                            orderStatus,
                            style: TextStyle(fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                      ),
            Flexible(
              child: Container(),
            ),

            Divider(
              height: 5.0,
              color: Colors.pink,
            )
          ],
        ))
      ],
    ),
  );
}

bool isCancelled(String cancelStatus) {
  return cancelStatus == 'cancelled';
}
