import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Address/addAddress.dart';
import 'package:e_shop/Store/Search.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Orders/myOrders.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../PhoneAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.yellow.shade300, Colors.yellow.shade300],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        EcommerceApp.sharedPreferences
                            .getString(EcommerceApp.userAvatarUrl),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  EcommerceApp.sharedPreferences
                      .getString(EcommerceApp.userName),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontFamily: "Signatra"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 1.0),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.yellow.shade300, Colors.yellow.shade300],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Colors.black),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => StoreHome());
                    Navigator.push(context, route);
                  },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.white,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(Icons.list, color: Colors.black),
                  title: Text(
                    "My Orders",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (c) => MyOrders());
                    Navigator.push(context, route);
                  },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.white,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart, color: Colors.black),
                  title: Text(
                    "My Cart",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (c) => CartPage());
                    Navigator.push(context, route);
                  },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.white,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(Icons.search, color: Colors.black),
                  title: Text(
                    "Search",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => SearchProduct());
                    Navigator.push(context, route);
                  },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.white,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(Icons.add_location, color: Colors.black),
                  title: Text(
                    "Add New Address",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => AddAddress());
                    Navigator.push(context, route);
                  },
                ),
                Divider(
                  height: 5.0,
                  color: Colors.white,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.black),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    _logout();
                    Route route =
                        MaterialPageRoute(builder: (_) => PhoneAuth());
                    Navigator.pushReplacement(context, route);
                    // EcommerceApp.auth.signOut().then((c) {
                    //   Route route =
                    //       MaterialPageRoute(builder: (c) => AuthenticScreen());
                    //   Navigator.pushReplacement(context, route);
                    // });
                  },
                ),
                // Divider(
                //   height: 10.0,
                //   color: Colors.white,
                //   thickness: 6.0,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _logout() async {
  /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
  try {
    // signout code
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e.toString());
  }
}
