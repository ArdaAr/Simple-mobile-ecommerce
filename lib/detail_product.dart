import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final Map<String,dynamic> dataProduct;
  
  const DetailProduct({Key ? key, required this.dataProduct}) : super(key:key);


  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // foto
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: dataProduct['images'].length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Align(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.89,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(dataProduct['images'][index], scale: 2,),
                              )
                            ),
                          ),
                      );
                    },
                  ),
                )
              )
              ,

              // Nama Product
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  dataProduct['title'],
                  style: const TextStyle(fontSize: 30),
                ),
              ),

              // Harga
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                color: const Color.fromARGB(255, 142, 204, 255),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "\$${dataProduct['price']}",
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )
              ),

              // Description
              Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dataProduct['description'],
                      style: TextStyle(fontSize: 15, height: 1.5, letterSpacing: 0.5, color: Colors.grey.shade800),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),

              // Rating & stock
              Container(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rating',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child : Row (
                            children: [
                              Text(
                                dataProduct['rating'].toString(),
                                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 153, 0))
                              ),
                              const Icon(Icons.star)
                            ],
                          )
                        )
                      ],
                    ),

                    Column(
                      children: [
                        const Text(
                          'Stok',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child : Text(
                            dataProduct['stock'].toString(),
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 153, 0))
                          )
                        )
                      ],
                    )

                  ],
                ),
              ),

              // tombol beli
              Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: ElevatedButton( // class untuk menyesuaikan size child dengan parent nya
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      backgroundColor: Colors.blue.shade900,
                      // fixedSize: FractionallySizedBox(),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return;
                      // }));
                    },
                  ),
                ),
              )
            ],
          ),
        )
        // Center(child: Text(dataProduct['title'])),
      ),
    );
  }

}