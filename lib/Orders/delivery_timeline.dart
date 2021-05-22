import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

// class DeliveryTimeline extends StatefulWidget {
//   @override
//   _DeliveryTimelineState createState() => _DeliveryTimelineState();
// }
//
// class _DeliveryTimelineState extends State<DeliveryTimeline> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF379A69),
//       child: Theme(
//         data: Theme.of(context).copyWith(
//           accentColor: const Color(0xFF27AA69).withOpacity(0.2),
//         ),
//         child: SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               iconTheme: IconThemeData(color: Colors.white),
//               flexibleSpace: Container(
//                 decoration: new BoxDecoration(
//                   gradient: new LinearGradient(
//                     colors: [Colors.pink, Colors.lightGreenAccent],
//                     begin: const FractionalOffset(0.0, 0.0),
//                     end: const FractionalOffset(1.0, 0.0),
//                     stops: [0.0,1.0],
//                     tileMode: TileMode.clamp,
//                   ),
//                 ),
//               ),
//               centerTitle: true,
//               title: Text("Tracking Details", style: TextStyle(color: Colors.white),),
//             ),
//             backgroundColor: Colors.white,
//             body: Column(
//               children: <Widget>[
//                 _Header(),
//                 Expanded(child: _TimelineDelivery()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class TimelineDelivery extends StatelessWidget {
  final String orderStatus;

  TimelineDelivery({Key key, this.orderStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List<Color> colors = shippingColors(orderStatus);

    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: colors[0],
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              asset: 'assets/delivery/order_placed.png',
              title: 'Order Placed',
              message: 'We have received your order.',
            ),
            beforeLineStyle: LineStyle(
              color: colors[1],
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: colors[2],
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              asset: 'assets/delivery/order_confirmed.png',
              title: 'Order Confirmed',
              message: 'Your order has been confirmed.',
            ),
            beforeLineStyle: LineStyle(
              color: colors[3],
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: colors[4],
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/delivery/order_processed.png',
              title: 'Order Packed',
              message: 'Your order has been Packed.',
            ),
            beforeLineStyle: LineStyle(
              color: colors[5],
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: colors[6],
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/delivery/order_shipped.png',
              title: 'Order Shipped',
              message: 'Your Order has been Shipped.',
            ),
            beforeLineStyle: LineStyle(
              color: colors[7],
            ),
            afterLineStyle: LineStyle(
              color: colors[8],
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: colors[9],
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/delivery/ready_to_pickup.png',
              title: 'Order Delivered',
              message: 'Your order is delivered.',
            ),
            beforeLineStyle: LineStyle(
              color: colors[10],
            ),
          ),
        ],
      ),
    );
  }

  List<Color> shippingColors(String orderStatus) {
    String status = orderStatus;
    List<Color> orderColors = [];

    switch (status.toLowerCase()) {
      case 'placed':
        orderColors = [
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF2B619C),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
        ];
        break;
      case 'confirmed':
        orderColors = [
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF2B619C),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
        ];
        break;
      case 'packed':
        orderColors = [
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF2B619C),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
        ];
        break;
      case 'shipped':
        orderColors = [
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF2B619C),
          Color(0xFFDADADA),
          Color(0xFFDADADA),
        ];
        break;
      case 'delivered':
        orderColors = [
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
          Color(0xFF27AA69),
        ];
        break;
    }

    return orderColors;
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key key,
    this.asset,
    this.title,
    this.message,
    this.disabled = false,
  }) : super(key: key);

  final String asset;
  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Opacity(
            child: Image.asset(asset, height: 35),
            opacity: disabled ? 0.5 : 1,
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: GoogleFonts.yantramanav(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
