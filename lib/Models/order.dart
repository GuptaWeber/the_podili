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
String adminOrderCancellationStatus;

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
    this.userOrderConfirmation,
    this.adminOrderCancellationStatus
  });

  OrderModel.fromJson(Map<String, dynamic> json) {

    print('ram ram ram 1');

    addressID = json['addressID'];
    print('ram ram ram 2');
    cancellationStatus = json['cancellationStatus'];
    print('ram ram ram 3');
    isSuccess = json['isSuccess'];
    print('ram ram ram 4');
    orderBy = json['orderBy'];
    print('ram ram ram 5');
    orderID = json['orderID'];
    print('ram ram ram 6');
    orderStatus = json['orderStatus'];
    print('ram ram ram 7');
    orderTime = json['orderTime'];
    print('ram ram ram 8');
    paymentId = json['paymentId'];
    print('ram ram ram 9');
    paymentDetails = json['paymentDetails'];
    print('ram ram ram 10');
    prefferedTime = json['prefferedTime'];
    print('ram ram ram 11');
    productIDs = json['productIDs'];
    print('ram ram ram 12');
    totalAmount = json['totalAmount'];
    print('ram ram ram 13');
    userOrderConfirmation = json['userOrderConfirmation'];
    print('ram ram ram 14');
    adminOrderCancellationStatus = json['adminOrderCancellationStatus'];

    print('dom dom dom');

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
    data['adminOrderCancellationStatus'] = this.adminOrderCancellationStatus;


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
