import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
String addressID;
String cancellationStatus;
bool isSuccess;
String orderBy;
String orderID;
String orderStatus;
String orderTime;
String paymentId;
String paymentDetails;
String prefferedTime;
List productIDs;
double totalAmount;
String userOrderConfirmation;

  OrderModel({
    this.addressID,
    this.cancellationStatus,
    this.isSuccess,
    this.orderBy,
    this.orderID,
    this.orderStatus,
    this.orderTime,
    this.paymentId,
    this.paymentDetails,
    this.prefferedTime,
    this.productIDs,
    this.totalAmount,
    this.userOrderConfirmation
  });

  OrderModel.fromJson(Map<String, dynamic> json) {

    addressID = json['addressID'];
    cancellationStatus = json['cancellationStatus'];
    isSuccess = json['isSuccess'];
    orderBy = json['orderBy'];
    orderID = json['orderID'];
    orderStatus = json['orderStatus'];
    orderTime = json['orderTime'];
    paymentId = json['paymentId'];
    paymentDetails = json['paymentDetails'];
    prefferedTime = json['prefferedTime'];
    productIDs = json['productIDs'];
    totalAmount = json['totalAmount'];
    userOrderConfirmation = json['userOrderConfirmation'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressID'] = this.addressID;
    data['isSuccess'] = this.isSuccess;
    data['orderBy'] = this.orderBy;

    if (this.orderID != null) {
      data['orderID'] = this.orderID;
    }

    if (this.orderTime != null) {
      data['orderTime'] = this.orderTime;
    }

    if (this.paymentId != null) {
      data['paymentId'] = this.paymentId;
    }

    if (this.cancellationStatus != null) {
      data['cancellationStatus'] = this.cancellationStatus;
    }

    if (this.orderStatus != null) {
      data['orderStatus'] = this.orderStatus;
    }

    if (this.prefferedTime != null) {
      data['prefferedTime'] = this.prefferedTime;
    }

    if (this.userOrderConfirmation != null) {
      data['userOrderConfirmation'] = this.userOrderConfirmation;
    }


    data['paymentDetails'] = this.paymentDetails;
    data['productIDs'] = this.productIDs;
    data['totalAmount'] = this.totalAmount;


    return data;
  }
}

class PublishedDate {
  String date;

  PublishedDate({this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
