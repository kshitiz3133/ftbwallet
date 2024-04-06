import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_service/ussd_service.dart';

class UssdMessage extends StatelessWidget {

  makeMyRequest() async {
    int subscriptionId = 1; // sim card subscription Id
    String code = "*21#"; // ussd code payload
    try {
      String ussdSuccessMessage = await UssdService.makeRequest(subscriptionId, code);
      print("succes! message: $ussdSuccessMessage");
    } catch (e) {
      print("error! code: ${e} - message: ${e}");
    }
  }
  UssdMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: (){
            makeMyRequest();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent[400]
              ),
              child: Text("- DEBIT"),
            ),
          )
        ],
      ),
    );
  }
}
