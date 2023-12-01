import 'package:flutter/material.dart';
import 'package:submission_flutter/detail_product.dart';
import 'package:submission_flutter/get_data.dart';
import 'package:submission_flutter/profil_page.dart';
// import 'package:convert/convert.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:submission_flutter/model/fetch_data.dart';

// DATA SUDAH MASUK HOMEPAGE NAMUN MASIH TIDAK BISA DIAKSES KARENA
// BUILD DIJALANKAN TERLEBIH DAHULU
// PERIKSA FUTURE BUILDER

class HomePage extends StatefulWidget {
  const HomePage({Key?key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> listBurgers = [];
  DataFromFetch data = DataFromFetch();

  Future<List<Map<String,dynamic>>> getData() async {
    listBurgers = await data.getBurger();
    // print(listBurgers[0]['title']);
    return listBurgers;
  }

  // @override
  // void initState(){
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(context) {
    // print(listBurgers);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ProfilPage();
                        }));
                      },
                      icon: const ImageIcon(AssetImage("images/face_icon.png"), size: 35, color: null),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'Hi, Alex',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                            'What do you want to order?',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue.shade900)
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(AssetImage("images/bell.png"), size: 25, color: null),
                    ),
                  ],
                ),
                const CardDiscount(),
                const SearchBar(
                    leading: Icon(Icons.search),
                    hintText: 'Find your stuffs...',
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Text(
                    'Most Popular Categories',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CategoriesButton(category:"All"),
                      CategoriesButton(category:"Apple"),
                      CategoriesButton(category:"Huawei"),
                      CategoriesButton(category:"Samsung"),
                    ],
                  ),
                ),
                Expanded(
                child: FutureBuilder<List<Map<String,dynamic>>>(
                  future: getData(), 
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Map<String,dynamic>> myBurgerList = snapshot.data!;
                      // print(myList[0]['title']);
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: myBurgerList.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return InkWell (
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return DetailProduct(dataProduct: myBurgerList[index],);
                              }));
                            }, // to detail page
                            child: Container( // container hanya untuk shadow
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(blurRadius: 2,spreadRadius: 1,color: Colors.grey.shade200)
                                ]
                              ),
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(right:20),
                                      child: Image.network(myBurgerList[index]['images'][0], scale: 8,),
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                              "${myBurgerList[index]['title']}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                                            ),
                                          Text(
                                              "${myBurgerList[index]['brand']}",
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(fontSize: 13,color: Colors.grey)
                                          ),
                                          Text(
                                              "\$${myBurgerList[index]['price']}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black)
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            )
                          );
                        }
                      );
                    }
                  })
              )
            ],
          ),
        )
      )
    );
  }
}

// Food Category class stateful widget SAMPAI SINI
// Lanjut benahin categories

class CategoriesButton extends StatefulWidget {
  final String? category;

  const CategoriesButton({Key? key, required this.category}) : super (key : key);

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  bool _pressed = true;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: () {
          return setState(() {
            _pressed = !_pressed;
          });
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            backgroundColor: _pressed ? Colors.blue.shade900 : Colors.white
        ),
        child: Text(
          '${widget.category}',
          style: TextStyle(color: _pressed ? Colors.white: Colors.blue.shade900),
        )
    );
  }
}

// Class card jumbotron discount
class CardDiscount extends StatelessWidget {
  const CardDiscount({Key?key}) : super(key:key);

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
      ),
      color: Colors.blue.shade900,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get special discount',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    'Up to 45%',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Food Discount"),
                      content: const Text("Sorry, Discount is not available"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            return Navigator.pop(context, 'OK');
                          },
                          child: const Text("OK")
                        )
                      ],
                    )
                  ),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    backgroundColor: Colors.white,
                    // fixedSize: FractionallySizedBox(),
                  ),
                  child: Text('Claim voucher', style: TextStyle(color: Colors.blue.shade900))
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(2),
              child: Image.asset('images/iphone.png', scale: 15),
            )
          ],
        ),
      )
    );
  }
}
