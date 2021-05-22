import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Models/address.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import 'myOrders.dart';

class PaymentPage extends StatefulWidget {
  final String addressId;
  final double totalAmount;
  final AddressModel model;

  PaymentPage({Key key, this.addressId, this.totalAmount, this.model}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _payment_method = 0;
  Razorpay _razorpay;
  TwilioFlutter twilioFlutter;
  String preferredTime = '7 AM';
  int i =0;
  List productList = EcommerceApp.sharedPreferences
      .getStringList(EcommerceApp.userCartList);
  List phonenumbers = ['+918501014199', '+919848208168', '+918106089784'];

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    twilioFlutter =
        TwilioFlutter(accountSid: 'AC35db7389289340fd2a6cd6c2bd51602f',
            authToken: '00fea30f08e9073b200ce07c40aa1948',
            twilioNumber: '+12027594159');

  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Image.asset("images/cash.png"),
              // ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Proceed Checkout",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              Card(
                margin: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Order Total : ",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "${widget.totalAmount.toString()}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Delivery Charges : ",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "20.0",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Divider(
                            height: 10,
                            thickness: 3,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Amount : ",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "${widget.totalAmount + 20}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "Choose Delivery Time : ",
                            style: TextStyle(fontSize: 20),
                          ),
                    DropdownButton<String>(
                    value: preferredTime,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        preferredTime = newValue;
                      });
                    },
                    items: <String>['7 AM', '8 AM', '9 AM', '10 AM', '11 AM', '12 PM', '1 PM', '2 PM', '3 PM', '4 PM', '5 PM', '6 PM', '7 PM', '8 PM', '9 PM']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Online Payment : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Radio<int>(
                            value: 1,
                            groupValue: _payment_method,
                            onChanged: (value) {
                              setState(() {
                                _payment_method = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Cash On Delivery : ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Radio<int>(
                            value: 2,
                            groupValue: _payment_method,
                            onChanged: (value) {
                              setState(() {
                                _payment_method = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {

                  if(_payment_method == 1){
                    openCheckout();
                  }else if(_payment_method == 2){
                    addOrderDetails();
                  }else {
                    Fluttertoast.showToast(
                        msg: "Please Select a Payment Method",
                        timeInSecForIos: 4);
                  }

                  },

                  style: TextButton.styleFrom(
                      primary: Colors.purple,
                      backgroundColor: Colors.green,
                      elevation: 5,
                      textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
                  child: Text(
                    "Place Order",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    ));
  }

  addOrderDetails() {

    String productDescription = '';

    for(i=1; i<productList.length; i++){
      productDescription = productDescription + productList[i] + ' ';
    }


    writeOrderDetailsForUser({
      EcommerceApp.addressID: widget.addressId,
      EcommerceApp.totalAmount: widget.totalAmount+20,
      "orderBy": EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID),
      "prefferedTime" : preferredTime,
      EcommerceApp.cancellationStatus: "notCancelled",
      EcommerceApp.userOrderConfirmation: "Not Received",
      EcommerceApp.orderStatus : "placed",
      EcommerceApp.productID: EcommerceApp.sharedPreferences
          .getStringList(EcommerceApp.userCartList),
      EcommerceApp.paymentDetails: "Cash on Delivery",
      EcommerceApp.orderTime: DateTime.now().millisecondsSinceEpoch.toString(),
      EcommerceApp.isSuccess: true,
    });

    writeOrderDetailsForAdmin({
      EcommerceApp.addressID: widget.addressId,
      EcommerceApp.totalAmount: widget.totalAmount+20,
      "orderBy": EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID),
      "prefferedTime" : preferredTime,
      EcommerceApp.orderStatus : "placed",
      EcommerceApp.cancellationStatus: "notCancelled",
      EcommerceApp.userOrderConfirmation: "Not Received",
      EcommerceApp.productID: EcommerceApp.sharedPreferences
          .getStringList(EcommerceApp.userCartList),
      EcommerceApp.paymentDetails: "Cash on Delivery",
      EcommerceApp.orderTime: DateTime.now().millisecondsSinceEpoch.toString(),
      EcommerceApp.isSuccess: true,
    }).whenComplete(() => {emptyCartNow()});

    phonenumbers.forEach((phone) {
      sendSms(phone, "${widget.model.name} has ordered ${productDescription} at a price ${widget.totalAmount + 20} with Cash on Delivery! contact at ${widget.model.phoneNumber}");
    });

  }

  emptyCartNow() {
    EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userCartList, ["garbageValue"]);
    List tempList =
        EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);

    Firestore.instance
        .collection("users")
        .document(
            EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID))
        .updateData({EcommerceApp.userCartList: tempList}).then((value) {
      EcommerceApp.sharedPreferences
          .setStringList(EcommerceApp.userCartList, tempList);
      Provider.of<CartItemCounter>(context, listen: false).displayResult();
    });

    Fluttertoast.showToast(
        msg: "Congratulations, your Order has been placed successfully.");

    // Route route = MaterialPageRoute(builder: (c) => SplashScreen());
    // Navigator.pushReplacement(context, route);
  }

  Future writeOrderDetailsForUser(Map<String, dynamic> data) async {
    await EcommerceApp.firestore
        .collection(EcommerceApp.collectionUser)
        .document(
            EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID))
        .collection(EcommerceApp.collectionOrders)
        .document(
            EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID) +
                data['orderTime'])
        .setData(data);

  }

  Future writeOrderDetailsForAdmin(Map<String, dynamic> data) async {
    await EcommerceApp.firestore
        .collection(EcommerceApp.collectionOrders)
        .document(
            EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID) +
                data['orderTime'])
        .setData(data);
    _onOrderSuccess();
  }

  void openCheckout() async {

    String productDescription = '';

    for(i=1; i<productList.length; i++){
      productDescription = productDescription + productList[i] + ' ';
    }

    print(productDescription);

    var options = {
      'key': 'rzp_test_Y0GRKKJ2grMEYj',
      'amount': (widget.totalAmount+20) * 100,
      'name': widget.model.name,
      'description': productDescription,
      'prefill': {'contact': widget.model.phoneNumber, 'email': 'venkatsrinu601@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    String productDescription = '';

    for(i=1; i<productList.length; i++){
      productDescription = productDescription + productList[i] + ' ';
    }



    Fluttertoast.showToast(
        msg: "Payment Successful" + response.paymentId, timeInSecForIos: 4);

    writeOrderDetailsForUser({
      EcommerceApp.addressID: widget.addressId,
      EcommerceApp.totalAmount: widget.totalAmount+20,
      "orderBy": EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID),
      "prefferedTime" : preferredTime,
      EcommerceApp.orderStatus : "placed",
      EcommerceApp.cancellationStatus: "notCancelled",
      EcommerceApp.userOrderConfirmation: "Not Received",
      EcommerceApp.productID: EcommerceApp.sharedPreferences
          .getStringList(EcommerceApp.userCartList),
      EcommerceApp.paymentDetails: "Online Payment",
      EcommerceApp.orderTime: DateTime.now().millisecondsSinceEpoch.toString(),
      EcommerceApp.isSuccess: true,
      'paymentId': response.paymentId
    });

    writeOrderDetailsForAdmin({
      EcommerceApp.addressID: widget.addressId,
      EcommerceApp.totalAmount: widget.totalAmount+20,
      "orderBy": EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID),
      "prefferedTime" : preferredTime,
      EcommerceApp.orderStatus : "placed",
      EcommerceApp.cancellationStatus: "notCancelled",
      EcommerceApp.userOrderConfirmation: "Not Received",
      EcommerceApp.productID: EcommerceApp.sharedPreferences
          .getStringList(EcommerceApp.userCartList),
      EcommerceApp.paymentDetails: "Online Payment",
      EcommerceApp.orderTime: DateTime.now().millisecondsSinceEpoch.toString(),
      EcommerceApp.isSuccess: true,
      'paymentId': response.paymentId
    }).whenComplete(() => {emptyCartNow()});


    phonenumbers.forEach((phone) {
      sendSms(phone, "${widget.model.name} has ordered ${productDescription} at a price ${widget.totalAmount + 20} and paid online! contact at ${widget.model.phoneNumber}");
    });



  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Not Done, Error in Payment" + response.code.toString() + " - " + response.message,
        timeInSecForIos: 4);
    _onOrderError();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  void sendSms(String number, String message) async {
    twilioFlutter.sendSMS(toNumber: number, messageBody: message);
  }

  Future<void> _onOrderSuccess() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 100,),
                Text('Your Order has been Placed Successfully!'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Home'),
              onPressed: () {
                Route route = MaterialPageRoute(builder: (c)=> StoreHome());
                Navigator.pushReplacement(context, route);
              },
            ),
            TextButton(
              child: Text('My Orders'),
              onPressed: () {
                Route route = MaterialPageRoute(builder: (c)=> MyOrders());
                Navigator.pushReplacement(context, route);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _onOrderError() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Confirmation'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Icon(Icons.cancel_rounded, color: Colors.red, size: 100,),
                Text('Your Order has failed!'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Home'),
              onPressed: () {
                Route route = MaterialPageRoute(builder: (c)=> StoreHome());
                Navigator.pushReplacement(context, route);
              },
            ),
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
