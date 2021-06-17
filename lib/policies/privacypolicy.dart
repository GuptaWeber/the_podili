import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  final String serviceID;

  PrivacyPolicy({Key key, this.serviceID}) : super(key: key);

  @override
  _ViewServiceRequestState createState() => _ViewServiceRequestState();
}

class _ViewServiceRequestState extends State<PrivacyPolicy> {
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
                  "Privacy Policy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text('''
SECTION-1: WHAT DO WE DO WITH YOUR INFORMATION?

When you purchase something from our android application as part of the buying and selling process we collect the personal information you give us such as Your name , address , Zip code , Phone number.
SECTION -2 CONSENT: HOW DO YOU GET MY CONSENT?

When you   provide us with personal information to complete a transaction, verify your credit card, place an order, arrange for a delivery or return a purchase , we imply that you consent to it and use it for that specific reason only. 

IN CASE FOR A WITHDRAWAL A CONSENT FORM?
If after you opt-in, you change your mind ,you may withdraw , for the continued collection , use or disclosure of your information , at anytime , by email venkatsrinu601@gmail.com


SECTION-3- DISCLOSURE 

We may  disclose your personal information if we are required by law to do so or if you violate our Terms of service 

SECTION-4 PAYMENT 

We use RAZORPAY for processing payments we/Razor pay do not store your card data on their services , The data  is encrypted through the payment card industry Data security standard ( PCI-DSS) when processing payment . Your purchase transaction data Is only used as long as it is necessary to complete you purchase transaction. After that is complete, your purchase transaction information is not saved 

Our payment gateway adgeres to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, MasterCard, American Express and Discover.
PCI-DSS requirements help ensure the secure handling of credit card information by our store and its service providers.
For more insight, you may also want to read terms and conditions of razorpay on https://razorpay.com

SECTION 5- SECURITY

To protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.

SECTION 6- COOKIES

We use cookies to maintain the session of your user. It is not used to personally identify you on store 






SECTION 9 - CHANGES TO THIS PRIVACY POLICY

We reserve the right to modify this privacy policy at any time, so please review it frequently. Changes and clarifications will take effect immediately upon their posting and updating in the application . If we make material changes to this policy, we will notify you here that it has been updated, so that you are aware of what information we collect, how we use it, and under what circumstances, if any, we use and/or disclose it.
If our store is acquired or merged with another company, your information may be transferred to the new owners so that we may continue to sell products to you.

QUESTIONS AND CONTACT INFORMATION

If you would like to: access, correct, amend or delete any personal information we have about you, register a complaint, or simply want more information contact our Privacy Compliance Officer at [venkatsrinu601@gmail.com] 

[Re: Privacy Compliance Officer]
4-14,konkan prittala Prakasam(Dt) 
Andhra Pradesh -523241


              '''),
            )
          ],
        )),
      ),
    );
  }
}
