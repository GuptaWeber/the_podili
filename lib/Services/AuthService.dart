import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/Screens/DashboardPage.dart';
import 'package:e_shop/Screens/LoginPage.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseUser _firebaseUser;
  //Handles Auth
  // handleAuth() {
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.onAuthStateChanged,
  //       builder: (BuildContext context, snapshot) {
  //         // if (snapshot.hasData) {
  //         //   return StoreHome();
  //         // } else {
  //           return LoginPage();
  //         // }
  //       });
  // }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  checkUser(FirebaseUser fUser) {
    Firestore.instance
        .collection("users")
        .where("phonenumber", isEqualTo: fUser.phoneNumber)
        .getDocuments()
        .then((snapshot) {
      // snapshot.documents.forEach((result) {
      //   if (result.data["phonenumber"] == fUser.phoneNumber) {
      //     print(result.data["phonenumber"]);
      //     print(fUser.phoneNumber);

      //   }
      // });
      if (snapshot.documents.isEmpty) {
        saveUserInfoToFireStore(fUser);
      }
      if (snapshot.documents.isNotEmpty) {
        saveUserInfoToSharedPreferences(fUser);
      }
    });
  }

  Future saveUserInfoToFireStore(FirebaseUser fUser) async {
    Firestore.instance.collection("users").document(fUser.uid).setData({
      "uid": fUser.uid,
      "phonenumber": fUser.phoneNumber,
      "isAdmin": "0",

      // "name": _nameTextEditingController.text.trim(),
      // "url": userImageUrl,
      EcommerceApp.userCartList: ["garbageValue"]
    });

    await EcommerceApp.sharedPreferences.setString("uid", fUser.uid);
    await EcommerceApp.sharedPreferences
        .setString(EcommerceApp.phoneNumber, fUser.phoneNumber);

    await EcommerceApp.sharedPreferences.setString("isAdmin", "0");
    // await EcommerceApp.sharedPreferences.setString(
    //     EcommerceApp.userName, _nameTextEditingController.text.trim());
    // await EcommerceApp.sharedPreferences
    //     .setString(EcommerceApp.userAvatarUrl, userImageUrl);
    await EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userCartList, ["garbageValue"]);

    return StoreHome();
  }

  Future saveUserInfoToSharedPreferences(FirebaseUser fUser) async {
    // print(f);
    // Firestore.instance.collection("users").document(fUser.uid).get()
    DocumentSnapshot variable =
        await Firestore.instance.collection('users').document(fUser.uid).get();

    await EcommerceApp.sharedPreferences.setString("uid", fUser.uid);
    await EcommerceApp.sharedPreferences
        .setString(EcommerceApp.phoneNumber, fUser.phoneNumber);

    await EcommerceApp.sharedPreferences
        .setString("isAdmin", variable["isAdmin"]);

    // await EcommerceApp.sharedPreferences.setString(
    //     EcommerceApp.userName, _nameTextEditingController.text.trim());
    // await EcommerceApp.sharedPreferences
    //     .setString(EcommerceApp.userAvatarUrl, userImageUrl);
    await EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userCartList, ["garbageValue"]);

    return StoreHome();
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance
        .signInWithCredential(authCreds)
        .then((AuthResult authRes) {
      _firebaseUser = authRes.user;
      print(_firebaseUser.toString());
      checkUser(_firebaseUser);

      // Route route = MaterialPageRoute(builder: (_) => StoreHome());
      // Navigator.pushReplacement(context, route);
    });
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);

    signIn(authCreds);
  }
}
