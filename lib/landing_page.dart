import 'package:flutter/material.dart';
import 'package:submission_flutter/home_page.dart';
// import 'package:submission_flutter/menu_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key?key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                widthFactor: 10,
                child: Image.asset('images/Take Away-rafiki.png', scale: 6,),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        'Navigating Tomorrow, Delivering Today!',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Ship smarter, ship faster with our innovative shipping solutions today.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10,left: 20, right: 20),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      backgroundColor: Colors.blue.shade900,

                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(context: context,
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          builder: (context){
                            return const LoginPanel();
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)
                              )
                          )
                      );
                    },
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Center(
                    child: Text(
                      'Version of 5.1.1',
                      style: TextStyle(color: Colors.grey),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// login Panel
class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key:key);

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 500,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Please enter your credentials to access your account',
                  textAlign:TextAlign.left,
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: TextFormField(
                    validator: (value) {
                      if (value == ''){
                        return "* Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: const Row(
                  // crossAxisAlignment: ,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Padding(padding: EdgeInsets.only(left: 20)),
                    CheckboxLogin(),
                    Text(
                      'I Agree to the Terms & Privacy',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                child: FractionallySizedBox(
                  widthFactor: 0.9,
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
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    },
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Center(
                  child: Text(
                    'Or log in with',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                      label: const Text('Google'),
                      icon: const ImageIcon(AssetImage("images/google.png"), size: 20),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40)
                      ),
                    ),
                    OutlinedButton.icon(
                      label: const Text('Facebook'),
                      icon: const ImageIcon(AssetImage("images/facebook.png"), size: 20,color: Colors.blue,),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40)
                        // textStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CheckboxLogin extends StatefulWidget {
  const CheckboxLogin({super.key});

  @override
  State<CheckboxLogin> createState() => _CheckboxLoginState();
}

class _CheckboxLoginState extends State<CheckboxLogin> {
  bool isChecked = false;

  @override
  Widget build(context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      });
  }
}