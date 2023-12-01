import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget  {
  const MenuPage({Key?key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea( 
        child : ListView.builder(
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
    );
  }

}