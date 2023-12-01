import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:submission_flutter/model/fetch_data.dart';

class DataFromFetch {
  List<Map<String, dynamic>> listDataBurgers = [] ;
  // link = https://burgers-hub.p.rapidapi.com/burgers
  // link = 'https://dummyjson.com/products'
  Future getBurger() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products')
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> temp = json.decode(response.body);
       
        print(temp['products'].runtimeType);
        List dataProducts = temp['products'];
        print(dataProducts);
        for (var product in dataProducts){
          listDataBurgers.add(product);
        }
        return listDataBurgers;
      }
    } catch (e) {
      throw('sorry, $e');
    }
  }
}


// ListView.separated(
//   scrollDirection: Axis.vertical,
//   itemCount: listBurgers.length,
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
//                     listBurgers[index].name,
//                     textAlign: TextAlign.start,
//                     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue.shade900),
//                   ),
//                   Text(
//                       listBurgers[index].desc,
//                       textAlign: TextAlign.start,
//                       style: const TextStyle(fontSize: 13,color: Colors.grey)
//                   ),
//                   Text(
//                       listBurgers[index].price.toString(),
//                       textAlign: TextAlign.start,
//                       style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black)
//                   )
//                 ],
//               )
//             ],
//           ),
//         )
//       )
//     );
//   }
// ),