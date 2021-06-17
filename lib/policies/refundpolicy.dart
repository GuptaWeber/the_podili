import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnPolicy extends StatefulWidget {
  final String serviceID;

  ReturnPolicy({Key key, this.serviceID}) : super(key: key);

  @override
  _ViewServiceRequestState createState() => _ViewServiceRequestState();
}

class _ViewServiceRequestState extends State<ReturnPolicy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Center(
              child: Container(
                child: Text(
                  "Return Policy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text('''
Returns
Our policy lasts 30 days. If 30 days have gone by since your purchase, unfortunately we can’t offer you a refund or exchange.
To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.
Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.
Additional non-returnable items:
Gift cards
Downloadable software products
Some health and personal care items
To complete your return, we require a receipt or proof of purchase.
Refunds (if applicable)
Once your return is received and inspected, we will send you an email or text message regarding your order  to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.
If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.
Late or missing refunds (if applicable)
If you haven’t received a refund yet, first check your bank account again.
Then contact your credit card company, it may take some time before your refund is officially posted.
Next contact your bank. There is often some processing time before a refund is posted.
If you’ve done all of this and you still have not received your refund yet, please contact us at 
venkatsrinu601@gmail.com

Sale items (if applicable)
Only regular priced items may be refunded, unfortunately sale items cannot be refunded.
Exchanges (if applicable)
We only replace items if they are defective or damaged.  If you need to exchange it for the same item, send us an email at [venkatsrinu601@gmail.com] 

Shipping
You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.
Depending on where you live, the time it may take for your exchanged product to reach you, may vary.

              '''),
            )
          ],
        )),
      ),
    );
  }
}
