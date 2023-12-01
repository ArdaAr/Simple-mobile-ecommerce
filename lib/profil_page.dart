import 'package:flutter/material.dart';

// Lanjutkan looping menu profil

class ProfilPage extends StatelessWidget {
  ProfilPage({Key?key}) : super(key: key);

  final List< Map<String,dynamic > > listMenuProfile = [
    {
      'firstIcon': Icons.location_on,
      'menuName': "My Address",
    },
    {
      'firstIcon': Icons.key,
      'menuName': "Edit Password"
    },
    {
      'firstIcon': Icons.circle_notifications_rounded,
      'menuName': "Notifications"
    },
    {
      'firstIcon': Icons.logout_outlined,
      'menuName': "Log Out"
    }
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/profil background.jpg'),
                        fit: BoxFit.cover,
                        scale: 10
                      ),  
                    ),
                    height: 200,
                    width: 500,
                    // color: Colors.blue,
                  ),
                  Container(),
                ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column( // column for profil pic and name
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('images/profil icon.png', scale: 7,),
                    ),
                    const Text(
                      "Alex Marquez", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    child: Column(
                      children: listMenuProfile.map((e) {
                        return ProfilMenu(
                          firstIcon: e["firstIcon"],
                          menuName: e['menuName']);
                      }).toList(),
                    )
                  ),
                )
              ],
            ),
          ],
        ) 
      )
    );
  }
}


// CLass for generating menu in profil page

class ProfilMenu extends StatelessWidget {
  final String ? menuName;
  final IconData ? firstIcon;
  // Widget Icon;
  
  const ProfilMenu({
    Key?key, this.menuName, this.firstIcon
  }) : super(key: key);

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            firstIcon,
            color: Colors.grey,
          ),
          Text(
            '$menuName',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey
          )
        ],
      ),
    );
  }
}