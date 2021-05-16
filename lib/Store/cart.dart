import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/adminOrderCard.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Address/address.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/loadingWidget.dart';
import 'package:e_shop/Models/item.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:e_shop/Counters/totalMoney.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'product_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalAmount;
  int count;
  List<int> counter = List.filled(100, 1);

  @override
  void initState() {
    super.initState();
    totalAmount = 0;
    count = 1;

    Provider.of<TotalAmount>(context, listen: false).display(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (EcommerceApp.sharedPreferences
                  .getStringList(EcommerceApp.userCartList)
                  .length ==
              1) {
            Fluttertoast.showToast(msg: "Your cart is Empty");
          } else {
            Route route = MaterialPageRoute(builder: (c) {
              return Address(
                totalAmount: totalAmount,
              );
            });
            Navigator.pushReplacement(context, route);
          }
        },
        label: Text("Check Out"),
        backgroundColor: Colors.pinkAccent,
        icon: Icon(Icons.navigate_next),
      ),
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Consumer2<TotalAmount, CartItemCounter>(
              builder: (context, amountProvider, cartProvider, c) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: cartProvider.count == 0
                          ? Container()
                          : Text(
                              "Total Price : ${amountProvider.totalAmount.toString()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500),
                            )),
                );
              },
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: EcommerceApp.firestore
                  .collection("items")
                  .where("shortInfo",
                      whereIn: EcommerceApp.sharedPreferences
                          .getStringList(EcommerceApp.userCartList))
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : snapshot.data.documents.length == 0
                        ? beginBuildingCart()
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                ItemModel model = ItemModel.fromJson(
                                    snapshot.data.documents[index].data);

                                if (index == 0) {
                                  totalAmount = 0;
                                  totalAmount = model.price * counter[index] +
                                      totalAmount;
                                } else {
                                  totalAmount = model.price * counter[index] +
                                      totalAmount;
                                }
                                if (snapshot.data.documents.length - 1 ==
                                    index) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    Provider.of<TotalAmount>(context,
                                            listen: false)
                                        .display(totalAmount);
                                  });
                                }

                                return cartinfo(
                                  model,
                                  context,
                                  count,
                                  index,
                                  increment: (productPrice, i) => {
                                    increaseQuantity(productPrice, i),
                                  },
                                  decrement: (productPrice, i) => {
                                    decreaseQuantity(productPrice, i),
                                  },
                                  removeCartFunction: () =>
                                      removeItemFromUserCart(model.shortInfo),
                                );
                              },
                              childCount: snapshot.hasData
                                  ? snapshot.data.documents.length
                                  : 0,
                            ),
                          );
              })
        ],
      ),
    );
  }

  Widget cartinfo(ItemModel model, BuildContext context, count, index,
      {Color background, increment, decrement, removeCartFunction}) {
    return InkWell(
        onTap: () {
          Route route =
              MaterialPageRoute(builder: (c) => ProductPage(itemModel: model));
          Navigator.push(context, route);
        },
        splashColor: Colors.pink,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5)),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    constraints:
                        new BoxConstraints.expand(height: 160.0, width: 160),
                    alignment: Alignment.bottomLeft,
                    padding:
                        new EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: new DecorationImage(
                        image: new NetworkImage(model.thumbnailUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    //     Row(
                    //       children: <Widget>[
                    //         Container(
                    //           padding: EdgeInsets.only(
                    //               left: 5, right: 5, top: 5, bottom: 5),
                    //           decoration: BoxDecoration(
                    //               color: Colors.black,
                    //               borderRadius: BorderRadius.circular(5.0)),
                    //           child: new Text('Category',
                    //               style: new TextStyle(
                    //                   fontSize: 12.0, color: Colors.white)),
                    //         ),
                    //       ],
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.only(
                    //           left: 5, right: 10, top: 5, bottom: 5),
                    //       decoration: BoxDecoration(
                    //           color: Colors.blue,
                    //           borderRadius: BorderRadius.circular(5.0)),
                    //       child: new Text('15% OFF - no code required',
                    //           style: new TextStyle(
                    //               fontSize: 12.0, color: Colors.white)),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        model.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              "\u20B9" + model.price.toString(),
                              style: TextStyle(
                                  fontSize: 18, color: Colors.green.shade700),
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 3.0,
                            ),
                            Container(
                                height: 30,
                                width: 30,
                                color: Colors.yellow,
                                child: IconButton(
                                  iconSize: 15,
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    decrement(model.price, index);
                                  },
                                  color: Colors.black,
                                  splashColor: Colors.yellow,
                                )),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              counter[index].toString(),
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Container(
                                height: 30,
                                width: 30,
                                color: Colors.yellow.shade300,
                                child: IconButton(
                                  iconSize: 15,
                                  icon: Icon(Icons.add_rounded),
                                  onPressed: () {
                                    increment(model.price, index);
                                  },
                                  color: Colors.black,
                                  splashColor: Colors.yellow,
                                )),
                            SizedBox(
                              width: 35.0,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: removeCartFunction == null
                                    ? Container(
                                        child: IconButton(
                                        icon: Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.pinkAccent,
                                        ),
                                        onPressed: () {
                                          checkItemInCart(
                                              model.shortInfo, context);
                                        },
                                      ))
                                    : IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.pinkAccent,
                                        ),
                                        onPressed: () {
                                          removeCartFunction();
                                          Route route = MaterialPageRoute(
                                              builder: (c) => StoreHome());
                                          Navigator.push(context, route);
                                        },
                                      )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider(color: Color(0xFFF2F2F2)),
                // SizedBox(
                //   height: 1,
                // ),
              ],
            ),
          ),
        ));
  }

  beginBuildingCart() {
    return SliverToBoxAdapter(
      child: Card(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        child: Container(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.insert_emoticon,
                color: Colors.white,
              ),
              Text("Cart is empty."),
              Text("Start adding items to your Cart. "),
            ],
          ),
        ),
      ),
    );
  }

  increaseQuantity(int productPrice, int i) {
    setState(() {
      counter[i]++;
    });
  }

  decreaseQuantity(int productPrice, int i) {
    setState(() {
      if (counter[i] > 1) counter[i]--;
    });
  }

  removeItemFromUserCart(String shortInfoAsId) {
    List tempCartList =
        EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);
    tempCartList.remove(shortInfoAsId);

    EcommerceApp.firestore
        .collection(EcommerceApp.collectionUser)
        .document(
            EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID))
        .updateData({
      EcommerceApp.userCartList: tempCartList,
    }).then((value) {
      Fluttertoast.showToast(msg: "Item Removed Successfully.");

      EcommerceApp.sharedPreferences
          .setStringList(EcommerceApp.userCartList, tempCartList);

      Provider.of<CartItemCounter>(context, listen: false).displayResult();
      totalAmount = 0;
    });
  }
}
