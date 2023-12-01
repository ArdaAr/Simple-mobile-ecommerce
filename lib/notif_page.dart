import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key?key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text('ini halaman notifikasi'),
        ),
      ),
    );
  }
}

// ListView.separated(
//   scrollDirection: Axis.vertical,
//   itemCount: 10,
//   separatorBuilder: (context, index) => const Divider(),
//   itemBuilder: (context, index) {
//     return InkWell (
//       onTap: () {}, // to detail page
//       child: Container( // container hanya untuk shadow
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//           boxShadow: [
//             BoxShadow(blurRadius: 2,spreadRadius: 1,color: Colors.grey.shade200)
//           ]
//         ),
//         child: Container(
//           color: Colors.white,
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.only(right:20),
//                 child: Image.asset('images/burger 1.png', scale: 15),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Burger 1',
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue.shade900),
//                   ),
//                   const Text(
//                       'Burger dengan keju',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(fontSize: 13,color: Colors.grey)
//                   ),
//                   const Text(
//                       "Rp. 30.000",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black)
//                   )
//                 ],
//               )
//             ],
//           ),
//         )
//       )
//     );
//   }
//   ),