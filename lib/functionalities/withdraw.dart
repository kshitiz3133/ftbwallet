import 'package:flutter/material.dart';
class Withdraw extends StatelessWidget {
  Withdraw({super.key});

  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("Deposit Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              TextField(
                controller: addressController,
                decoration: InputDecoration(hintText: "Enter the Email",hintStyle: TextStyle(fontSize: 12)),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(hintText: "Enter the Amount",hintStyle: TextStyle(fontSize: 12)),
              ),
              TextField(
                controller: reasonController,
                decoration: InputDecoration(hintText: "Enter the Reason",hintStyle: TextStyle(fontSize: 12)),
              ),
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent[100]
                ),
                child: Text("- DEBIT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}