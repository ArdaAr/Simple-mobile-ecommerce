import 'package:flutter/material.dart';
// import 'package:flutter_textfield_search/search.dart'

class HomePage extends StatelessWidget {
  const HomePage({Key?key}) : super(key: key);

  @override
  Widget build(context) {
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
                      onPressed: () {},
                      icon: const ImageIcon(AssetImage("images/face_icon.png"), size: 100, color: null),
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
                    hintText: 'Find your food...',
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
                      CategoriesButton(category:"Deserts"),
                      CategoriesButton(category:"Cake"),
                      CategoriesButton(category:"Junk"),
                    ],
                  ),
                ),
                // Content burger ini kalau bisa dibuat perulangan dengan data fetching API
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container( // container hanya untuk shadow
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
                              child: Image.asset('images/burger 1.png', scale: 15),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Burger 1',
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                                ),
                                const Text(
                                    'Burger dengan keju',
                                    style: TextStyle(fontSize: 13,color: Colors.grey)
                                ),
                                const Text(
                                    "Rp. 30.000",
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black)
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    );
                  }
                ),
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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get special discount',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const Text(
                  'Up to 45%',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {},
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
              child: Image.asset('images/pizza.png', scale: 5),
            )
          ],
        ),
      )
    );
  }
}
