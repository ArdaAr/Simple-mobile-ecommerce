class Burger {
  final int id;
  final String name;
  final String desc;
  final int price;
  final List imageUrl;

  Burger({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.imageUrl
  });
  
 
  // factory Burger.fromJson(Map<String, dynamic> json) {
  //   return switch (json){
  //     {
  //       'id' : int id,
  //       'name' : String title,
  //       'desc' : String description,
  //       'price' : int price,
  //       'imageUrl' : List images
  //     } =>
  //       Burger(
  //         id : id,
  //         name : title,
  //         desc : description,
  //         price : price,
  //         imageUrl : images
  //       ),
  //     _ => throw const FormatException('Failed to load album.'),
  //   };
  // }
}



// class FetchMenuData extends StatefulWidget {
//   const FetchMenuData({Key ? key}) :super(key:key);

//   @override
//   State<FetchMenuData> createState() => _FetchMenuData();
// }

// class _FetchMenuData extends State<FetchMenuData> {


//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   _getData()
  
// }

// class
