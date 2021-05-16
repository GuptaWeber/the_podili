import 'package:flutter/material.dart';
import 'package:e_shop/Services/AuthService.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(child: DrawerTab()),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellow.shade400,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        iconSize: 30,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 85.0),
                      child: Text(
                        "PODILI",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.black),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15),
                  color: Colors.yellow.shade400,
                  height: 75,
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          margin: EdgeInsets.all(5),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search For Items",
                                      icon: Icon(Icons.search,
                                          color: Colors.black)),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Container(
                              constraints: new BoxConstraints.expand(
                                  height: 200.0, width: 300),
                              alignment: Alignment.bottomLeft,
                              padding:
                                  new EdgeInsets.only(left: 8.0, bottom: 4.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                      'https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_1280.jpg'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Trending this\nWeek',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('30 Places')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Container(
                              constraints: new BoxConstraints.expand(
                                  height: 200.0, width: 300),
                              alignment: Alignment.bottomLeft,
                              padding:
                                  new EdgeInsets.only(left: 8.0, bottom: 4.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                      'https://cdn.pixabay.com/photo/2017/12/17/13/10/architecture-3024174_1280.jpg'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      "Bengaluru's \nFinest",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('124 Places')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Container(
                              constraints: new BoxConstraints.expand(
                                  height: 200.0, width: 300),
                              alignment: Alignment.bottomLeft,
                              padding:
                                  new EdgeInsets.only(left: 8.0, bottom: 4.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                      'https://cdn.pixabay.com/photo/2015/05/15/14/55/cafe-768771__480.jpg'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Newly Opened',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('6 Places')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Container(
                              constraints: new BoxConstraints.expand(
                                  height: 200.0, width: 300),
                              alignment: Alignment.bottomLeft,
                              padding:
                                  new EdgeInsets.only(left: 8.0, bottom: 4.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                      'https://cdn.pixabay.com/photo/2019/03/31/07/48/food-4092617__480.jpg'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Just Delivery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('10 Places')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: Container(
                              constraints: new BoxConstraints.expand(
                                  height: 200.0, width: 300),
                              alignment: Alignment.bottomLeft,
                              padding:
                                  new EdgeInsets.only(left: 8.0, bottom: 4.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: new DecorationImage(
                                  image: new NetworkImage(
                                      'https://cdn.pixabay.com/photo/2015/03/26/09/42/breakfast-690128__480.jpg'),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Legends of \nGold',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text('10 Places')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://rs.projects-abroad.net/v1/hero/indian-cuisine-south-africa-food-tours-product-5e146c7a97eb2.[1600].jpeg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Food')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://review.chinabrands.com/chinabrands/seo/image/20181116/wholesalegroceries.jpg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Groceries')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://fyi.extension.wisc.edu/safefood/files/2019/04/CDC_produce.png',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Vegetables')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://img.huffingtonpost.com/asset/5cd366a42300003100b78725.jpeg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Eggs & Meat')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://www.empr.com/wp-content/uploads/sites/7/2018/12/medicine-bottles-pills-tablets_762263.jpg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Medicines')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://www.heritagefoods.in/static/images/detailslider/milk/tonemilk.png',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Milk & Products')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://img1.10bestmedia.com/Images/Photos/380699/GettyImages-855447930_54_990x660.jpg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Ice Creams')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://i.pinimg.com/originals/4c/90/69/4c906919db5ec51de6a7bcafc76e2812.png',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Cool Drinks')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ClipOval(
                                child: Image.network(
                              'https://www.zinmobi.com/wp-content/uploads/2015/05/online-ordering.jpg',
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Fast Food')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
