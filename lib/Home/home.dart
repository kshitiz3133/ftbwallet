import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ftbwallet/functionalities/deposit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Your Balance:", style: TextStyle(color: Colors.white, fontSize: 20)),
                    Center(child: Text("100", style: TextStyle(color: Colors.white, fontSize: 40))),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Center(child: Text("Send", style: TextStyle(fontSize: 30, color: Colors.white))),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Deposit()));
                      },
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black),
                        child: Center(child: Text("Add Money", style: TextStyle(fontSize: 30, color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text("Transactions", textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
              const SizedBox(height: 12,),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.black),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("1 ETH",style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Text('TXNID',style: TextStyle(color: Colors.white),),                       
                          Text('Reason',style: TextStyle(color: Colors.white),),
                      
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}