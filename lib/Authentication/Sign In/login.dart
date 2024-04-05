import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ftbwallet/Animation/wave.dart';
import 'package:ftbwallet/homePage.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAnimation(),
          Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));},
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: SvgPicture.asset("assets/Icon/indian.svg",color: Colors.black,),
                  ),
                  Text("Face Unlock",style: TextStyle(fontSize: 20),),
                  Text("शकल से लॉगिन करें",style: TextStyle(fontSize: 20),),
                  SizedBox(
                    height: 100,
                    child: Transform.scale(scale: 2,child: SvgPicture.asset("assets/Icon/fingerprint.svg",color: Colors.black,)),
                  ),
                  Text("Fingerprint Unlock",style: TextStyle(fontSize: 20),),
                  Text("शकल से लॉगिन करें",style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
