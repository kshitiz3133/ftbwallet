import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: SvgPicture.asset("assets/Icon/indian.svg",color: Colors.black,),
            ),
            Text(
              "हमारा सिक्का, आपकी अमानत !",
              style: TextStyle(
                fontSize: 20
              ),
            ),


          ],
        ),
      ),
    );
  }
}
